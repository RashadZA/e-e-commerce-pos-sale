import 'package:flutter/material.dart';

enum SlideArtKind { sales, inventory, insights }

/// Per-slide colour palette. Each slide ships a [light] and [dark] variant.
class SlidePalette {
  final Color bgStart;
  final Color bgEnd;
  final Color accent;
  final Color text;
  final Color muted;
  final Color glow;

  const SlidePalette({
    required this.bgStart,
    required this.bgEnd,
    required this.accent,
    required this.text,
    required this.muted,
    required this.glow,
  });

  static SlidePalette lerp(SlidePalette a, SlidePalette b, double t) {
    return SlidePalette(
      bgStart: Color.lerp(a.bgStart, b.bgStart, t)!,
      bgEnd: Color.lerp(a.bgEnd, b.bgEnd, t)!,
      accent: Color.lerp(a.accent, b.accent, t)!,
      text: Color.lerp(a.text, b.text, t)!,
      muted: Color.lerp(a.muted, b.muted, t)!,
      glow: Color.lerp(a.glow, b.glow, t)!,
    );
  }
}

class SlideModel {
  final String number;
  final String tag;
  final String title;
  final String subtitle;
  final SlideArtKind art;
  final SlidePalette light;
  final SlidePalette dark;

  const SlideModel({
    required this.number,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.art,
    required this.light,
    required this.dark,
  });

  SlidePalette palette(bool isDark) => isDark ? dark : light;
}

const List<SlideModel> kSlides = [
  SlideModel(
    number: '01',
    tag: 'SALES',
    title: 'Track Every Sale\nInstantly',
    subtitle: 'Keep every transaction recorded automatically, the moment it happens.',
    art: SlideArtKind.sales,
    light: SlidePalette(
      bgStart: Color(0xFFECFDF5),
      bgEnd: Color(0xFFD1FAE5),
      accent: Color(0xFF10B981),
      text: Color(0xFF0F172A),
      muted: Color(0xFF475569),
      glow: Color(0x6610B981),
    ),
    dark: SlidePalette(
      bgStart: Color(0xFF050813),
      bgEnd: Color(0xFF0A1024),
      accent: Color(0xFF34D399),
      text: Colors.white,
      muted: Color(0xFF94A3B8),
      glow: Color(0xA634D399),
    ),
  ),
  SlideModel(
    number: '02',
    tag: 'INVENTORY',
    title: 'Never Run Out of\nStock Again',
    subtitle: 'Get smart low-stock alerts before your bestsellers disappear.',
    art: SlideArtKind.inventory,
    light: SlidePalette(
      bgStart: Color(0xFFF5F3FF),
      bgEnd: Color(0xFFEDE9FE),
      accent: Color(0xFF8B5CF6),
      text: Color(0xFF0F172A),
      muted: Color(0xFF475569),
      glow: Color(0x668B5CF6),
    ),
    dark: SlidePalette(
      bgStart: Color(0xFF0A0824),
      bgEnd: Color(0xFF120A33),
      accent: Color(0xFFA78BFA),
      text: Colors.white,
      muted: Color(0xFF94A3B8),
      glow: Color(0xA6A78BFA),
    ),
  ),
  SlideModel(
    number: '03',
    tag: 'INSIGHTS',
    title: 'Grow With\nClear Insights',
    subtitle: 'See what sells, what doesn\'t, and where your shop is heading.',
    art: SlideArtKind.insights,
    light: SlidePalette(
      bgStart: Color(0xFFECFEFF),
      bgEnd: Color(0xFFCFFAFE),
      accent: Color(0xFF06B6D4),
      text: Color(0xFF0F172A),
      muted: Color(0xFF475569),
      glow: Color(0x6606B6D4),
    ),
    dark: SlidePalette(
      bgStart: Color(0xFF051528),
      bgEnd: Color(0xFF0A2638),
      accent: Color(0xFF22D3EE),
      text: Colors.white,
      muted: Color(0xFF94A3B8),
      glow: Color(0xA622D3EE),
    ),
  ),
];

const SlidePalette kFinishPaletteLight = SlidePalette(
  bgStart: Color(0xFFF0FDF4),
  bgEnd: Color(0xFFDCFCE7),
  accent: Color(0xFF10B981),
  text: Color(0xFF0F172A),
  muted: Color(0xFF475569),
  glow: Color(0x6610B981),
);

const SlidePalette kFinishPaletteDark = SlidePalette(
  bgStart: Color(0xFF021A12),
  bgEnd: Color(0xFF052E1B),
  accent: Color(0xFF34D399),
  text: Colors.white,
  muted: Color(0xFF94A3B8),
  glow: Color(0xA634D399),
);
