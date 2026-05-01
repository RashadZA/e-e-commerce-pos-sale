import 'package:e_commerce_pos_sale/core/API/Service/api_call.dart';
import 'package:e_commerce_pos_sale/core/API/Service/api_repositories.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/routes/unknow_route_page.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/auth_controller.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/onboarding_controller.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/splash_controller.dart';
import 'package:e_commerce_pos_sale/modules/startUp/presentation/screens/auth_view.dart';
import 'package:e_commerce_pos_sale/modules/startUp/presentation/screens/onboarding_view.dart';
import 'package:e_commerce_pos_sale/modules/startUp/presentation/screens/splash_view.dart';
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
      page: () => const SplashView(),
      transition: Transition.cupertino,
      binding: BindingsBuilder(
            () => Get.lazyPut<SplashController>(() => SplashController(),fenix: true,),
      ),
    ),
    GetPage(
      name: Routes.landingScreen,
      page: () => const OnboardingView(),
      transition: Transition.cupertino,
      binding: BindingsBuilder(
            () => Get.lazyPut<OnboardingController>(() => OnboardingController(),fenix: true,),
      ),
    ),
    GetPage(
      name: Routes.auth,
      page: () => const AuthView(),
      transition: Transition.cupertino,
      binding: BindingsBuilder(
            () => Get.lazyPut<AuthController>(() => AuthController(),fenix: true,),
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