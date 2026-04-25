import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/API/Service/api_repositories.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:e_commerce_pos_sale/core/routes/app_pages.dart';

class LandingScreenController extends GetxController{

  final APIRepository apiRepository = Get.find<APIRepository>();
  final ThemeController themeController = Get.find<ThemeController>();

  RxString userToken = "".obs;
  RxString getUserId = "".obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {}

  @override
  void onReady() {
    ready();
    super.onReady();
  }

  Future<void> ready() async {}

  Future<void> loginButtonOnPressedMethod() async {
    // Get.offAllNamed(Routes.signInScreen);
  }

  @override
  void onClose() {
    close();
    super.onClose();
  }

  Future<void> close() async {}

}