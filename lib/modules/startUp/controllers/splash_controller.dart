import 'package:e_commerce_pos_sale/core/API/Service/api_repositories.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final APIRepository apiRepository = Get.find<APIRepository>();
  final ThemeController themeController = Get.find<ThemeController>();

  /// Total time the splash is visible before navigating away.
  static const Duration totalDuration = Duration(milliseconds: 2600);

  @override
  void onReady() {
    super.onReady();
    _scheduleNext();
  }

  Future<void> _scheduleNext() async {
    await Future.delayed(totalDuration);
    Get.offAllNamed(Routes.landingScreen);
  }
}
