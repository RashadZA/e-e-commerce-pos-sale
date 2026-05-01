import 'dart:math' as math;
import 'package:e_commerce_pos_sale/core/components/widgets/window_title_bar.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Touch the controller so it initialises and starts its timer.
    controller; // ignore: unnecessary_statements
    return Scaffold(body: WindowChrome(child: _SplashBody(splashController: controller,)));
  }
}

class _SplashBody extends StatefulWidget {
  final SplashController splashController;
  const _SplashBody({required this.splashController});

  @override
  State<_SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<_SplashBody> with TickerProviderStateMixin {
  late final AnimationController _intro;
  late final AnimationController _loop;
  late final AnimationController _shimmer;
  late final AnimationController _dots;

  @override
  void initState() {
    super.initState();
    _intro = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..forward();
    _loop = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000))
      ..repeat();
    _shimmer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..repeat();
    _dots = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat();
  }

  @override
  void dispose() {
    _intro.dispose();
    _loop.dispose();
    _shimmer.dispose();
    _dots.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.splashController.themeController;
    return Obx(() {
      final isDark = theme.isDark.value;
      final accent = isDark ? accentDark : accentLight;
      final glow = glowColor(isDark);
      final muted = isDark ? mutedDark : mutedLight;
      final bg = isDark ? gradientDark : gradientLight;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: bg,
          ),
        ),
        child: Stack(
          children: [
            _DriftingOrbs(loop: _loop, accent: accent, isDark: isDark),
            if (isDark)
              Positioned.fill(
                child: IgnorePointer(
                    child: CustomPaint(painter: _GridPainter())),
              ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _LogoBadge(
                    intro: _intro,
                    loop: _loop,
                    shimmer: _shimmer,
                    accent: accent,
                    glow: glow,
                    isDark: isDark,
                  ),
                  const SizedBox(height: 32),
                  _Reveal(
                    intro: _intro,
                    delay: 0.38,
                    child: Text(
                      'E-commerce POS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: muted,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _Reveal(
                    intro: _intro,
                    delay: 0.45,
                    child: Text(
                      'SALES · INVENTORY · INSIGHTS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 4,
                        color: accent,
                        shadows: isDark
                            ? [Shadow(color: glow, blurRadius: 18)]
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  _Reveal(
                    intro: _intro,
                    delay: 0.60,
                    child: _LoadingDots(
                        dots: _dots, accent: accent, glow: glow, isDark: isDark),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 28,
              child: _Reveal(
                intro: _intro,
                delay: 0.80,
                child: Center(
                  child: Text(
                    'Made for shopkeepers · v1.0',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.4,
                      color: muted,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _Reveal extends StatelessWidget {
  final AnimationController intro;
  final double delay;
  final Widget child;
  const _Reveal({required this.intro, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final anim = CurvedAnimation(
      parent: intro,
      curve: Interval(delay, math.min(1, delay + 0.45),
          curve: Curves.easeOutCubic),
    );
    return AnimatedBuilder(
      animation: anim,
      builder: (_, _) => Opacity(
        opacity: anim.value.clamp(0, 1),
        child: Transform.translate(
          offset: Offset(0, (1 - anim.value) * 14),
          child: child,
        ),
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  final AnimationController intro;
  final AnimationController loop;
  final AnimationController shimmer;
  final Color accent;
  final Color glow;
  final bool isDark;
  const _LogoBadge({
    required this.intro,
    required this.loop,
    required this.shimmer,
    required this.accent,
    required this.glow,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final onAccent = isDark ? const Color(0xFF0F172A) : Colors.white;
    return SizedBox(
      width: 176,
      height: 176,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            AnimatedBuilder(
              animation: loop,
              builder: (_, _) {
                final t = (loop.value + i / 3) % 1.0;
                final scale = 0.55 + t * 0.9;
                final opacity = (1 - t).clamp(0.0, 1.0) * 0.55;
                return Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: accent, width: 1.5),
                      ),
                    ),
                  ),
                );
              },
            ),
          AnimatedBuilder(
            animation: loop,
            builder: (_, _) {
              final t = (math.sin(loop.value * 2 * math.pi) + 1) / 2;
              return Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent.withValues(alpha:
                  isDark ? 0.35 + 0.20 * t : 0.22 + 0.18 * t),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: Listenable.merge([intro, loop, shimmer]),
            builder: (_, _) {
              final introAnim = CurvedAnimation(
                parent: intro,
                curve: const Interval(0, 0.55, curve: Curves.easeOutBack),
              );
              final scale = 0.4 + 0.6 * introAnim.value;
              final rot = (-12 + 12 * introAnim.value) * math.pi / 180;
              final floatY = math.sin(loop.value * 2 * math.pi) * 4;

              return Transform.translate(
                offset: Offset(0, floatY),
                child: Transform.rotate(
                  angle: rot,
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [accent, accent.withValues(alpha: 0.8)],
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: glow,
                            blurRadius: isDark ? 50 : 36,
                            offset: const Offset(0, 18),
                            spreadRadius: -8,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: Transform.translate(
                                offset:
                                    Offset((shimmer.value * 220) - 110, 0),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withValues(alpha: 0),
                                        Colors.white.withValues(alpha: 0.5),
                                        Colors.white.withValues(alpha: 0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.show_chart_rounded,
                                size: 52, color: onAccent),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LoadingDots extends StatelessWidget {
  final AnimationController dots;
  final Color accent;
  final Color glow;
  final bool isDark;
  const _LoadingDots(
      {required this.dots,
      required this.accent,
      required this.glow,
      required this.isDark});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: dots,
      builder: (_, _) => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (i) {
          final delay = i * 0.18;
          final t = (dots.value + 1 - delay) % 1.0;
          final v = math.sin(t * math.pi).clamp(0.0, 1.0);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Transform.scale(
              scale: 0.6 + 0.4 * v,
              child: Opacity(
                opacity: 0.5 + 0.5 * v,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                    boxShadow: isDark
                        ? [BoxShadow(color: glow, blurRadius: 10)]
                        : null,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _DriftingOrbs extends StatelessWidget {
  final AnimationController loop;
  final Color accent;
  final bool isDark;
  const _DriftingOrbs(
      {required this.loop, required this.accent, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: loop,
      builder: (_, _) {
        final t = math.sin(loop.value * 2 * math.pi);
        return Stack(
          children: [
            Positioned(
              left: -160 + t * 40,
              top: -160 + t * 30,
              child: _orb(520, isDark ? 0.55 : 0.45),
            ),
            Positioned(
              right: -180 - t * 50,
              bottom: -180 - t * 30,
              child: _orb(600, isDark ? 0.45 : 0.40),
            ),
          ],
        );
      },
    );
  }

  Widget _orb(double size, double opacity) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              accent.withValues(alpha: opacity),
              accent.withValues(alpha: 0),
            ],
          ),
        ),
      );
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..strokeWidth = 1;
    const step = 48.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter old) => false;
}
