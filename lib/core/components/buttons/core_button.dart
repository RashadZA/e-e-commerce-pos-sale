import 'package:flutter/material.dart';

class CoreButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final BorderRadius borderRadius;

  const CoreButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
  });

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,

        // 👇 HOVER (Web/Desktop)
        hoverColor: Colors.black.withValues(alpha: 0.06),

        // 👇 PRESSED overlay (like ElevatedButton)
        highlightColor: Colors.black.withValues(alpha: 0.12),

        // 👇 SPLASH ripple
        splashColor: Colors.black.withValues(alpha: 0.18),

        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
