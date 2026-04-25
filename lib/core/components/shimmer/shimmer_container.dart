import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:e_commerce_pos_sale/core/components/shimmer/shimmer_container_widget.dart';

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Widget? listViewWidget;
  final ShimmerDirection direction;
  const ShimmerContainer({super.key, this.width, this.height, this.radius, this.listViewWidget, this.direction = const ShimmerDirection.fromLTRB(),});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(milliseconds: 1200),
      interval: const Duration(milliseconds: 300),
      color: Colors.grey.shade300,
      colorOpacity: 0.6,
      enabled: true,
      direction: direction,
      child: listViewWidget ?? ShimmerContainerWidget(
        width: width,
        height: height,
        radius: radius,
      ),
    );
  }
}