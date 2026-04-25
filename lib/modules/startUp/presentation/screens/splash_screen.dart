import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:e_commerce_pos_sale/modules/startUp/controllers/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
        return Obx(()=> Scaffold(
          backgroundColor: controller.themeController.isDark.value ? backgroundColorForDarkMode : backgroundColorForLightMode,
          body: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: .cover,
                image: AssetImage(AppIcons.appBackground),
              )
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: isMobile() ? AppTextTheme.text34.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                    ) : AppTextTheme.text50.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: isMobile() ? 110 : 200,
                        height: isMobile() ? 110 : 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppIcons.appIcon),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: isMobile() ? 120 : 210,
                        height: isMobile() ? 120 : 210,
                        child: CircularProgressIndicator(
                          color: secondaryColor,
                          backgroundColor: primaryColor.withValues(alpha: 0.5),
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      }
    );
  }
}
