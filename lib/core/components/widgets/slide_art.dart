import 'package:e_commerce_pos_sale/core/models/slide_model.dart';
import 'package:flutter/material.dart';

/// CustomPainter illustrations for each onboarding slide.
class SlideArt extends StatelessWidget {
  final SlideArtKind kind;
  final SlidePalette palette;
  final bool isDark;

  const SlideArt({
    super.key,
    required this.kind,
    required this.palette,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: _SlideArtPainter(kind, palette, isDark),
      ),
    );
  }
}

class _SlideArtPainter extends CustomPainter {
  final SlideArtKind kind;
  final SlidePalette p;
  final bool isDark;
  _SlideArtPainter(this.kind, this.p, this.isDark);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Soft circular halo behind the art.
    final halo = Paint()
      ..shader = RadialGradient(
        colors: [
          p.accent.withValues(alpha: isDark ? 0.30 : 0.22),
          p.accent.withValues(alpha: 0),
        ],
      ).createShader(Rect.fromCircle(
          center: Offset(w / 2, h / 2), radius: w * 0.42));
    canvas.drawCircle(Offset(w / 2, h / 2), w * 0.42, halo);

    switch (kind) {
      case SlideArtKind.sales:
        _paintSales(canvas, size);
        break;
      case SlideArtKind.inventory:
        _paintInventory(canvas, size);
        break;
      case SlideArtKind.insights:
        _paintInsights(canvas, size);
        break;
    }
  }

  void _paintSales(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    // Phone
    final phoneRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.55, h * 0.20, w * 0.30, h * 0.55),
      const Radius.circular(22),
    );
    canvas.drawRRect(
      phoneRect,
      Paint()..color = isDark ? const Color(0xFF1E293B) : Colors.white,
    );
    canvas.drawRRect(
      phoneRect.deflate(4),
      Paint()..color = isDark ? const Color(0xFF0F172A) : Colors.white,
    );
    // Screen content (price line)
    final screenRect = phoneRect.deflate(10);
    canvas.drawRect(
      Rect.fromLTWH(screenRect.left + 10, screenRect.top + 14, w * 0.16, 8),
      Paint()..color = p.accent.withValues(alpha: 0.25),
    );
    canvas.drawRect(
      Rect.fromLTWH(screenRect.left + 10, screenRect.top + 30, w * 0.10, 8),
      Paint()..color = p.muted.withValues(alpha: 0.5),
    );

    // Person silhouette
    final personPaint = Paint()..color = p.accent;
    canvas.drawCircle(Offset(w * 0.32, h * 0.42), w * 0.07, personPaint);
    final body = Path()
      ..moveTo(w * 0.18, h * 0.78)
      ..quadraticBezierTo(w * 0.32, h * 0.50, w * 0.46, h * 0.78)
      ..close();
    canvas.drawPath(body, personPaint);
  }

  void _paintInventory(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final boxPaint = Paint()..color = p.accent;
    final boxLight = Paint()..color = p.accent.withValues(alpha: 0.55);
    // 3 stacked boxes
    final r = const Radius.circular(8);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(w * 0.30, h * 0.55, w * 0.40, h * 0.18), r),
        boxPaint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(w * 0.22, h * 0.36, w * 0.30, h * 0.18), r),
        boxLight);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(w * 0.50, h * 0.36, w * 0.30, h * 0.18), r),
        boxLight);

    // Alert dot
    canvas.drawCircle(
      Offset(w * 0.78, h * 0.30),
      w * 0.04,
      Paint()..color = const Color(0xFFEF4444),
    );
  }

  void _paintInsights(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    // Bars
    final bars = [0.55, 0.38, 0.62, 0.30, 0.50];
    final barW = w * 0.08;
    for (int i = 0; i < bars.length; i++) {
      final x = w * 0.20 + i * (barW + 8);
      final barH = h * bars[i];
      canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(x, h * 0.78 - barH, barW, barH),
            const Radius.circular(6)),
        Paint()..color = p.accent.withValues(alpha: 0.45 + (i % 2) * 0.35),
      );
    }
    // Trend line
    final path = Path()
      ..moveTo(w * 0.18, h * 0.30)
      ..quadraticBezierTo(w * 0.40, h * 0.10, w * 0.55, h * 0.25)
      ..quadraticBezierTo(w * 0.70, h * 0.40, w * 0.82, h * 0.18);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round
        ..color = p.accent,
    );
  }

  @override
  bool shouldRepaint(covariant _SlideArtPainter old) =>
      old.kind != kind || old.p != p || old.isDark != isDark;
}
