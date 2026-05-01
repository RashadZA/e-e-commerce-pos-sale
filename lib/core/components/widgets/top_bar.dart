import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'window_title_bar.dart';

/// In-screen top bar — shows the brand, theme toggle and an optional Skip.
/// On desktop, the brand & theme toggle live in the [WindowTitleBar] instead,
/// so this widget shows ONLY the Skip action (right-aligned).
class TopBar extends StatelessWidget {
  final VoidCallback? onSkip;
  final Color accent;
  final Color text;
  final Color muted;
  final Color glow;
  final bool isDark;

  const TopBar({
    super.key,
    required this.accent,
    required this.text,
    required this.muted,
    required this.glow,
    required this.isDark,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    final isDesktop = WindowTitleBar.isDesktop;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 14, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isDesktop)
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: glow,
                        blurRadius: isDark ? 22 : 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(Icons.show_chart_rounded,
                      color: isDark ? const Color(0xFF0F172A) : Colors.white,
                      size: 20),
                ),
                const SizedBox(width: 10),
                Text('E-COMMERCE POS',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                      letterSpacing: 1.4,
                      color: accent,
                      height: 1.2,
                    )),
              ],
            )
          else
            const SizedBox.shrink(),
          Row(
            children: [
              if (!isDesktop)
                _ThemeSwitch(
                  isDark: isDark,
                  accent: accent,
                  glow: glow,
                  onTap: theme.toggle,
                ),
              if (onSkip != null) ...[
                if (!isDesktop) const SizedBox(width: 12),
                TextButton(
                  onPressed: onSkip,
                  style: TextButton.styleFrom(
                    foregroundColor: muted,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  child: const Text('Skip',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _ThemeSwitch extends StatelessWidget {
  final bool isDark;
  final Color accent;
  final Color glow;
  final VoidCallback onTap;
  const _ThemeSwitch({
    required this.isDark,
    required this.accent,
    required this.glow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        width: 56,
        height: 32,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.10)
                : Colors.black.withValues(alpha: 0.08),
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: accent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: glow,
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
              size: 14,
              color: isDark ? const Color(0xFF0F172A) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
