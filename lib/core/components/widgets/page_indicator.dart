import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final Color accent;
  final Color glow;
  final bool isDark;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.accent,
    required this.glow,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? accent
                : (isDark
                    ? Colors.white.withValues(alpha: 0.18)
                    : Colors.black.withValues(alpha: 0.18)),
            borderRadius: BorderRadius.circular(99),
            boxShadow: isActive && isDark
                ? [BoxShadow(color: glow, blurRadius: 14, spreadRadius: 1)]
                : null,
          ),
        );
      }),
    );
  }
}
