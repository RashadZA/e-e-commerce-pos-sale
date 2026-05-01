import 'package:e_commerce_pos_sale/core/components/widgets/cta_buttons.dart';
import 'package:e_commerce_pos_sale/core/components/widgets/page_indicator.dart';
import 'package:e_commerce_pos_sale/core/components/widgets/slide_art.dart';
import 'package:e_commerce_pos_sale/core/components/widgets/top_bar.dart';
import 'package:e_commerce_pos_sale/core/components/widgets/window_title_bar.dart';
import 'package:e_commerce_pos_sale/core/models/slide_model.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WindowChrome(
        child: Obx(() {
          final isDark = controller.themeController.isDark.value;
          final palette = _currentPalette(isDark);

          return AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [palette.bgStart, palette.bgEnd],
              ),
            ),
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, box) {
                  final isWide = box.maxWidth >= AppSizes.wideBreakpoint;
                  return isWide
                      ? _WideLayout(palette: palette, isDark: isDark)
                      : _CompactLayout(palette: palette, isDark: isDark);
                },
              ),
            ),
          );
        }),
      ),
    );
  }

  SlidePalette _currentPalette(bool isDark) {
    final offset = controller.scrollOffset.value;
    final i = offset.floor().clamp(0, controller.lastIndex);
    final j = (i + 1).clamp(0, controller.lastIndex);
    final t = (offset - i).clamp(0.0, 1.0);
    final a = controller.slides[i].palette(isDark);
    final b = controller.slides[j].palette(isDark);
    if (controller.isFinished.value) {
      return isDark ? kFinishPaletteDark : kFinishPaletteLight;
    }
    return SlidePalette.lerp(a, b, t);
  }
}

/* ---------- Layouts ---------- */

class _CompactLayout extends StatelessWidget {
  final SlidePalette palette;
  final bool isDark;
  const _CompactLayout({required this.palette, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<OnboardingController>();
    return Column(
      children: [
        TopBar(
          accent: palette.accent,
          text: palette.text,
          muted: palette.muted,
          glow: palette.glow,
          isDark: isDark,
          onSkip: c.isFinished.value ? null : c.skip,
        ),
        Expanded(
          child: PageView.builder(
            controller: c.pageController,
            itemCount: c.slides.length,
            itemBuilder: (context, i) => _SlideContent(
              slide: c.slides[i],
              palette: palette,
              isDark: isDark,
              compact: true,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Obx(() => PageIndicator(
              count: c.slides.length,
              currentIndex: c.currentIndex.value,
              accent: palette.accent,
              glow: palette.glow,
              isDark: isDark,
            )),
        const SizedBox(height: 20),
        Obx(() => Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
              child: c.isFinished.value
                  ? FinishCta(
                      onTap: () => Get.toNamed('/auth'),
                      accent: palette.accent,
                      glow: palette.glow,
                      isDark: isDark,
                    )
                  : PrimaryCta(
                      label:
                          c.currentIndex.value == c.lastIndex ? 'Get Started' : 'Next',
                      onTap: c.next,
                      accent: palette.accent,
                      glow: palette.glow,
                      isDark: isDark,
                    ),
            )),
      ],
    );
  }
}

class _WideLayout extends StatelessWidget {
  final SlidePalette palette;
  final bool isDark;
  const _WideLayout({required this.palette, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<OnboardingController>();
    return Column(
      children: [
        TopBar(
          accent: palette.accent,
          text: palette.text,
          muted: palette.muted,
          glow: palette.glow,
          isDark: isDark,
          onSkip: c.isFinished.value ? null : c.skip,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 24),
            child: Row(
              children: [
                // Left — text & CTA
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 540),
                      child: Obx(() {
                        final slide = c.slides[c.currentIndex.value];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _SlideText(
                              slide: slide,
                              palette: palette,
                            ),
                            const SizedBox(height: 32),
                            PageIndicator(
                              count: c.slides.length,
                              currentIndex: c.currentIndex.value,
                              accent: palette.accent,
                              glow: palette.glow,
                              isDark: isDark,
                            ),
                            const SizedBox(height: 28),
                            c.isFinished.value
                                ? FinishCta(
                                    onTap: () => Get.toNamed('/auth'),
                                    accent: palette.accent,
                                    glow: palette.glow,
                                    isDark: isDark,
                                  )
                                : PrimaryCta(
                                    label: c.currentIndex.value == c.lastIndex
                                        ? 'Get Started'
                                        : 'Next',
                                    onTap: c.next,
                                    accent: palette.accent,
                                    glow: palette.glow,
                                    isDark: isDark,
                                  ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(width: 56),
                // Right — illustration via PageView for swipe parity
                Expanded(
                  child: PageView.builder(
                    controller: c.pageController,
                    itemCount: c.slides.length,
                    itemBuilder: (_, i) {
                      final slide = c.slides[i];
                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: SlideArt(
                            kind: slide.art,
                            palette: palette,
                            isDark: isDark,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/* ---------- Slide content (compact) ---------- */

class _SlideContent extends StatelessWidget {
  final SlideModel slide;
  final SlidePalette palette;
  final bool isDark;
  final bool compact;
  const _SlideContent({
    required this.slide,
    required this.palette,
    required this.isDark,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: SlideArt(
                  kind: slide.art,
                  palette: palette,
                  isDark: isDark,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: _SlideText(slide: slide, palette: palette, center: true),
          ),
        ],
      ),
    );
  }
}

class _SlideText extends StatelessWidget {
  final SlideModel slide;
  final SlidePalette palette;
  final bool center;
  const _SlideText(
      {required this.slide, required this.palette, this.center = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          '${slide.number} — ${slide.tag}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 3.2,
            color: palette.accent,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          slide.title,
          textAlign: center ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            height: 1.15,
            letterSpacing: -0.6,
            color: palette.text,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          slide.subtitle,
          textAlign: center ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: palette.muted,
          ),
        ),
      ],
    );
  }
}
