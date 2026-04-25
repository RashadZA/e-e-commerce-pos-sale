import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_pos_sale/core/components/shimmer/shimmer_container_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerGridviewBuilderWidget extends StatelessWidget {
  final int? itemCount;
  final double? containerWidth;
  final double? containerHeight;
  final EdgeInsetsGeometry? paddingListViewBuilder;
  final double? shimmerContainerWidth;
  final double? shimmerContainerHeight;
  final double? shimmerContainerRadius;
  final ScrollPhysics? physics;
  final Widget? gridViewWidget;
  final ShimmerDirection direction;

  const ShimmerGridviewBuilderWidget({
    super.key,
    this.itemCount,
    this.containerWidth,
    this.containerHeight,
    this.paddingListViewBuilder,
    this.shimmerContainerWidth,
    this.shimmerContainerHeight,
    this.shimmerContainerRadius,
    this.physics,
    this.gridViewWidget,
    this.direction = const ShimmerDirection.fromLTRB(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: containerWidth ?? Get.width,
      height: containerHeight ?? Get.height,
      child: GridView.builder(
        itemCount: itemCount ?? 20,
        shrinkWrap: true,
        physics: physics,
        padding: paddingListViewBuilder ?? const EdgeInsets.all(15.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1,
          mainAxisExtent: 120,
        ),
        itemBuilder: (context, index) {
          return Shimmer(
            duration: const Duration(milliseconds: 1200),
            interval: const Duration(milliseconds: 300),
            color: Colors.grey.shade300,
            colorOpacity: 0.6,
            enabled: true,
            direction: direction,
            child: gridViewWidget ??
                ShimmerContainerWidget(
                  height: shimmerContainerHeight ?? 60,
                  width: shimmerContainerWidth,
                  radius: shimmerContainerRadius ?? 8,
                ),
          );
        },
      ),
    );
  }
}
