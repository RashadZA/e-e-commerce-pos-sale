import 'package:flutter/material.dart';

/// "Get Started" / "Next" — pill button with shimmer sweep.
class PrimaryCta extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color accent;
  final Color glow;
  final bool isDark;

  const PrimaryCta({
    super.key,
    required this.label,
    required this.onTap,
    required this.accent,
    required this.glow,
    required this.isDark,
  });

  @override
  State<PrimaryCta> createState() => _PrimaryCtaState();
}

class _PrimaryCtaState extends State<PrimaryCta>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmer;

  @override
  void initState() {
    super.initState();
    _shimmer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onAccent =
        widget.isDark ? const Color(0xFF0F172A) : Colors.white;

    return GestureDetector(
      onTap: widget.onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [widget.accent, widget.accent.withValues(alpha: 0.86)],
            ),
            borderRadius: BorderRadius.circular(99),
            boxShadow: [
              BoxShadow(
                color: widget.glow,
                blurRadius: widget.isDark ? 36 : 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _shimmer,
                  builder: (context, _) => Positioned.fill(
                    child: Transform.translate(
                      offset: Offset((_shimmer.value * 600) - 300, 0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0),
                              Colors.white.withValues(alpha: 0.35),
                              Colors.white.withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 6, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: onAccent,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: onAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_forward_rounded,
                            color: widget.accent, size: 22),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Welcome / Finish CTA — circular check with pulse rings.
class FinishCta extends StatefulWidget {
  final VoidCallback onTap;
  final Color accent;
  final Color glow;
  final bool isDark;
  const FinishCta({
    super.key,
    required this.onTap,
    required this.accent,
    required this.glow,
    required this.isDark,
  });

  @override
  State<FinishCta> createState() => _FinishCtaState();
}

class _FinishCtaState extends State<FinishCta>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onAccent =
        widget.isDark ? const Color(0xFF0F172A) : Colors.white;
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 200,
        height: 120,
        child: Stack(
          alignment: Alignment.center,
          children: [
            for (int i = 0; i < 2; i++)
              AnimatedBuilder(
                animation: _pulse,
                builder: (context, _) {
                  final t = ((_pulse.value + i * 0.5) % 1.0);
                  return Opacity(
                    opacity: (1 - t).clamp(0.0, 1.0) * 0.55,
                    child: Container(
                      width: 70 + t * 60,
                      height: 70 + t * 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: widget.accent, width: 1.5),
                      ),
                    ),
                  );
                },
              ),
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [widget.accent, widget.accent.withValues(alpha: 0.85)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.glow,
                    blurRadius: widget.isDark ? 36 : 28,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Icon(Icons.check_rounded, size: 44, color: onAccent),
            ),
          ],
        ),
      ),
    );
  }
}
