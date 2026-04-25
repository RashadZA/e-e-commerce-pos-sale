import 'package:e_commerce_pos_sale/core/API/Service/api_call.dart';
import 'package:e_commerce_pos_sale/core/API/Service/api_repositories.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/routes/unknow_route_page.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/landing_screen_controller.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/splash_screen_controller.dart';
import 'package:e_commerce_pos_sale/modules/startUp/presentation/screens/landing_screen.dart';
import 'package:e_commerce_pos_sale/modules/startUp/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final unknownRoute = GetPage(
    name: Routes.unknown404,
    page: () => const Unknown404Screen(),
  );
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
      binding: BindingsBuilder(
            () => Get.lazyPut<SplashScreenController>(() => SplashScreenController(),fenix: true,),
      ),
    ),
    GetPage(
      name: Routes.landingScreen,
      page: () => const LandingScreen(),
      transition: Transition.cupertino,
      binding: BindingsBuilder(
            () => Get.lazyPut<LandingScreenController>(() => LandingScreenController(),fenix: true,),
      ),
    ),
  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() {
      Get.lazyPut<APIRepository>(() => APIRepository(), fenix: true);
      Get.lazyPut<APICall>(() => APICall(), fenix: true);
      Get.lazyPut<ThemeController>(() => ThemeController(), fenix: true);
    });
  }
}