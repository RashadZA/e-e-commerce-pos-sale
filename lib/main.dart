import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'core/routes/app_pages.dart';
import 'core/utils/design_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'E-Commerce POS Sale',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.currentTheme.value,
      initialRoute: Routes.splashScreen,
      // initialRoute: Routes.mainScreen,
      getPages: AppPages.routes,
      initialBinding: BindingsX.initialBindigs(),
    );
  }
}

