import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class ShimmerContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  const ShimmerContainerWidget({super.key, this.width, this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 5),
      child: Container(
        width: width ?? Get.width,
        height: height ?? 20.0,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(radius ?? 5),
            boxShadow: const [
              BoxShadow(
                color:  Colors.black54,
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ]
        ),
      ),
    );
  }
}