import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;
  RxBool isDark = false.obs;

  Future<void> savedTheme({bool? value}) async {
    await deleteTheme();
    if (value != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('ECommercePOSSaleDarkTheme', value);
      getLocalStorageTheme();
    } else {
      // switchTheme();
    }
    update();
  }

  void getLocalStorageTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? theme = prefs.getBool('stanyRestaurantManagementSystemDarkTheme');
    if (theme != null) {
      isDark.value = theme;
    } else {
      isDark.value = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    }
    // Force the entire app to update
    Get.changeThemeMode(currentTheme.value);
    Get.forceAppUpdate(); // This forces all GetBuilders to rebuild
    update();
  }
  Future<void> deleteTheme({bool? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('stanyRestaurantManagementSystemDarkTheme');
    update();
  }

  Color getThemeColor(bool theme) {
    if (theme == true) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  void onInit() {
    getLocalStorageTheme();
    super.onInit();
  }
}
