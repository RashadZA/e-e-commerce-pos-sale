import 'dart:io' show Platform;

import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/routes/app_pages.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Enforce minimum window size (1080 x 600) and hide the native title bar
  //    on Windows / macOS / Linux. We render our own taller branded title bar.
  // if (!kIsWeb && !Platform.isAndroid && !Platform.isIOS
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();
    const opts = WindowOptions(
      size: AppSizes.minDesktop,
      minimumSize: AppSizes.minDesktop,
      center: true,
      backgroundColor: splashBgLight,
      titleBarStyle: TitleBarStyle.hidden,
      title: 'E-commerce POS',
    );
    await windowManager.waitUntilReadyToShow(opts, () async {
      await windowManager.setMinimumSize(AppSizes.minDesktop);
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // 2. Make the system bars transparent so the splash gradient flows
  //    edge-to-edge on mobile.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Eager-register app-wide dependencies (theme, etc.) so they exist before
    // any route binding runs.
    final themeCtrl = Get.put(ThemeController());

    return Obx(() {
      final isDark = themeCtrl.isDark.value;

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        ),
      );

      return GetMaterialApp(
        title: 'E-commerce POS',
        debugShowCheckedModeBanner: false,
        themeMode: themeCtrl.themeMode,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        unknownRoute: AppPages.unknownRoute,
        initialBinding: BindingsX.initialBindigs(),

        // ---- Routing (Get.toNamed / Get.offAllNamed) ----
        initialRoute: Routes.splashScreen,
        getPages: AppPages.routes,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),

        // Wrap every page in a brand-coloured container so route transitions
        // never expose a white background.
        builder: (context, child) {
          return Container(
            color: isDark ? splashBgDark : splashBgLight,
            child: child ?? const SizedBox.shrink(),
          );
        },
      );
    });
  }
}
