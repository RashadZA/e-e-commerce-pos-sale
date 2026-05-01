import 'dart:io' show Platform;

import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';


/// A taller, branded title bar that replaces the default Windows / macOS /
/// Linux chrome. On mobile and web it renders nothing.
class WindowTitleBar extends StatelessWidget {
  const WindowTitleBar({super.key});

  static bool get isDesktop {
    if (kIsWeb) return false;
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  @override
  Widget build(BuildContext context) {
    if (!isDesktop) return const SizedBox.shrink();

    final theme = Get.find<ThemeController>();

    return Obx(() {
      final isDark = theme.isDark.value;
      final accent = isDark ? accentDark : accentLight;
      final bg = isDark ? splashBgDark : splashBgLight;
      final text = isDark ? textDark : textLight;
      final muted = isDark ? mutedDark : mutedLight;
      final glow = glowColor(isDark);

      return Container(
        height: AppSizes.titleBarHeight,
        decoration: BoxDecoration(
          color: bg,
          border: Border(
            bottom: BorderSide(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.06),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),

            // Brand badge
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: glow,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: Icon(
                Icons.show_chart_rounded,
                color: isDark ? const Color(0xFF0F172A) : Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'E-COMMERCE POS',
              style: TextStyle(
                color: accent,
                fontWeight: FontWeight.w700,
                fontSize: 9,
                letterSpacing: 1.4,
                height: 1.1,
              ),
            ),

            // Drag area fills the middle
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (_) => windowManager.startDragging(),
                onDoubleTap: () async {
                  if (await windowManager.isMaximized()) {
                    await windowManager.unmaximize();
                  } else {
                    await windowManager.maximize();
                  }
                },
                child: const SizedBox.expand(),
              ),
            ),

            // Theme toggle (compact)
            _ThemeToggleButton(
              isDark: isDark,
              accent: accent,
              glow: glow,
              text: text,
              muted: muted,
              onTap: theme.toggle,
            ),
            const SizedBox(width: 6),

            // Window controls
            _WindowButton(
              icon: Icons.remove,
              color: muted,
              hoverBg: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.06),
              onTap: () => windowManager.minimize(),
            ),
            _WindowButton(
              icon: Icons.crop_square_outlined,
              size: 14,
              color: muted,
              hoverBg: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.06),
              onTap: () async {
                if (await windowManager.isMaximized()) {
                  await windowManager.unmaximize();
                } else {
                  await windowManager.maximize();
                }
              },
            ),
            _WindowButton(
              icon: Icons.close,
              color: muted,
              hoverColor: Colors.white,
              hoverBg: const Color(0xFFE81123),
              onTap: () => windowManager.close(),
            ),
          ],
        ),
      );
    });
  }
}

/// Tiny sun/moon switch sized for the title bar.
class _ThemeToggleButton extends StatelessWidget {
  final bool isDark;
  final Color accent;
  final Color glow;
  final Color text;
  final Color muted;
  final VoidCallback onTap;
  const _ThemeToggleButton({
    required this.isDark,
    required this.accent,
    required this.glow,
    required this.text,
    required this.muted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
        width: 52,
        height: 28,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(99),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.10)
                : Colors.black.withValues(alpha: 0.08),
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
          alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: accent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: glow,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
              size: 12,
              color: isDark ? const Color(0xFF0F172A) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _WindowButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color? hoverColor;
  final Color hoverBg;
  final double size;
  final VoidCallback onTap;
  const _WindowButton({
    required this.icon,
    required this.color,
    required this.hoverBg,
    required this.onTap,
    this.hoverColor,
    this.size = 16,
  });

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 46,
          height: AppSizes.titleBarHeight,
          color: _hover ? widget.hoverBg : Colors.transparent,
          child: Icon(
            widget.icon,
            size: widget.size,
            color: _hover && widget.hoverColor != null
                ? widget.hoverColor
                : widget.color,
          ),
        ),
      ),
    );
  }
}

/// Wrap any page body with this so the title bar appears at the top of the
/// window on desktop. On mobile/web it's a no-op.
class WindowChrome extends StatelessWidget {
  final Widget child;
  const WindowChrome({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!WindowTitleBar.isDesktop) return child;
    return Column(
      children: [
        const WindowTitleBar(),
        Expanded(child: child),
      ],
    );
  }
}
