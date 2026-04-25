import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class Unknown404Screen extends StatelessWidget {
  const Unknown404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.withValues(alpha: 0.5),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  // height: 250,
                  child: Image.asset(
                    "assets/images/images/Multigym.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20,),
                defaultLoader(),
                const SizedBox(height: 15,),
                Text(
                    "Page not found",
                  style: AppTextTheme.text22.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "We are sorry but the page you are looking for cannot be found",
                  textAlign: TextAlign.center,
                  style: AppTextTheme.text18.copyWith(
                      overflow: TextOverflow.visible
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}