import 'package:e_commerce_pos_sale/modules/startUp/controllers/landing_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/components/buttons/container_button.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class LandingScreen extends GetWidget<LandingScreenController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          backgroundColor: transparentColor,
          body: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientStartColor,
                  gradientCenterColor,
                  gradientEndColor
                ],
                begin: .topCenter,
                end: .bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SizedBox(height: isMobile() ? (Get.height * 0.20) : (Get.height * 0.11),),
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.all(0),
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        width: isMobile() ? 120 : 200,
                        height: isMobile() ? 120 : 200,
                        child: Image.asset(
                          AppIcons.appIcon,
                          fit: .contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      "Let's Get Started !",
                      textAlign: .center,
                      style: AppTextTheme.text22.copyWith(
                        color: whiteColor,
                        fontWeight: .w600,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Center(
                      child: SizedBox(
                        width: isMobile() ? (Get.width) : (Get.width * 0.55),
                        child: Text(
                          "Login into to have a full digital experience in Restaurant Management Software",
                          textAlign: .center,
                          style: AppTextTheme.text22.copyWith(
                              color: whiteColor,
                              fontWeight: .normal,
                              overflow: .visible
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Center(
                      child: ContainerButton(
                        onPressed: ()=> controller.loginButtonOnPressedMethod(),
                        isDark: false,
                        isButtonIsTapped: false,
                        height: isMobile() ? 40 : 55,
                        width: isMobile() ? (Get.width) : (Get.width * 0.6),
                        borderRadius: 12,
                        buttonColor: whiteColor,
                        buttonText: "LOGIN",
                        buttonTextStyle: AppTextTheme.text16.copyWith(
                            color: primaryColor,
                            fontWeight: .bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    // Text(
                    //   "Don't Have an Account? then Click On",
                    //   textAlign: .center,
                    //   style: AppTextTheme.text13.copyWith(
                    //     color: whiteColor,
                    //     fontWeight: .normal,
                    //   ),
                    // ),
                    // const SizedBox(height: 15,),
                    // ContainerButton(
                    //   onPressed: ()=> controller.signUpButtonOnPressedMethod(),
                    //   isDark: false,
                    //   isButtonIsTapped: false,
                    //   height: 40,
                    //   width: Get.width,
                    //   borderRadius: 12,
                    //   buttonColor: whiteColor,
                    //   buttonText: "SIGN UP",
                    //   buttonTextStyle: AppTextTheme.text16.copyWith(
                    //       color: primaryColor,
                    //       fontWeight: .bold
                    //   ),
                    // ),
                    SizedBox(height: isMobile() ? (Get.height * 0.17) : (Get.height * 0.1),),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
