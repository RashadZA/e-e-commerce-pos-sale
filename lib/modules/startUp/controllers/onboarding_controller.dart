import 'package:e_commerce_pos_sale/core/API/Service/api_repositories.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/models/slide_model.dart';
import 'package:e_commerce_pos_sale/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {

  final APIRepository apiRepository = Get.find<APIRepository>();
  final ThemeController themeController = Get.find<ThemeController>();

  final PageController pageController = PageController();

  final RxInt currentIndex = 0.obs;
  final RxDouble scrollOffset = 0.0.obs; // 0 .. (slides.length - 1) for parallax
  final RxBool isFinished = false.obs;

  List<SlideModel> get slides => kSlides;
  int get lastIndex => slides.length - 1;
  bool get isLast => currentIndex.value >= lastIndex;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!pageController.hasClients) return;
    final page = pageController.page ?? 0;
    scrollOffset.value = page;
    final next = page.round();
    if (next != currentIndex.value && next >= 0 && next <= lastIndex) {
      currentIndex.value = next;
      isFinished.value = false;
    }
  }

  Future<void> next() async {
    if (isLast) {
      isFinished.value = true;
      Get.toNamed(Routes.auth);
      return;
    }
    await pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> previous() async {
    if (currentIndex.value == 0) return;
    await pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> jumpTo(int index) async {
    await pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  void skip() {
    Get.offAllNamed(Routes.auth);
  }

  @override
  void onClose() {
    pageController.removeListener(_onScroll);
    pageController.dispose();
    super.onClose();
  }
}
