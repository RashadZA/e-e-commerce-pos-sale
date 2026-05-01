import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/API/Service/api_repositories.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/routes/app_pages.dart';

class SplashScreenController extends GetxController with WidgetsBindingObserver{

  final APIRepository apiRepository = Get.find<APIRepository>();
  final ThemeController themeController = Get.find<ThemeController>();


  RxString userToken = "".obs;
  RxString getUserId = "".obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    init();
    super.onInit();
  }

  @override
  void onReady() {
    ready();
    super.onReady();
  }

  Future<void> ready() async {
    // themeController.getLocalStorageTheme();
    // themeController.savedTheme(value: Get.isDarkMode);
    // Get.changeThemeMode(themeController.currentTheme.value);
  }

  Future<void> init() async {
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Get.offAllNamed(Routes.splashScreen); // Navigate to splash screen
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    close();
    super.onClose();
  }
  Future<void> close() async {}

}