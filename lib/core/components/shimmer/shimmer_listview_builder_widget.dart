import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:e_commerce_pos_sale/core/components/shimmer/shimmer_container_widget.dart';

class ShimmerListViewBuilderWidget extends StatelessWidget {
  final int? itemCount;
  final double? containerWidth;
  final double? containerHeight;
  final EdgeInsetsGeometry? paddingListViewBuilder;
  final double? shimmerContainerWidth;
  final double? shimmerContainerHeight;
  final double? shimmerContainerRadius;
  final ScrollPhysics? physics;
  final Widget? listViewWidget;
  final ShimmerDirection direction;

  const ShimmerListViewBuilderWidget({
    super.key,
    this.itemCount,
    this.containerWidth,
    this.containerHeight,
    this.paddingListViewBuilder,
    this.shimmerContainerWidth,
    this.shimmerContainerHeight,
    this.shimmerContainerRadius,
    this.physics,
    this.listViewWidget,
    this.direction = const ShimmerDirection.fromLTRB(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: containerWidth ?? Get.width,
      height: containerHeight ?? Get.height,
      child: ListView.separated(
        itemCount: itemCount ?? 10,
        shrinkWrap: true,
        physics: physics ?? NeverScrollableScrollPhysics(),
        primary: false,
        padding: paddingListViewBuilder ?? const EdgeInsets.all(0.0),
        separatorBuilder: (context, index)=> const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            Shimmer(
              duration: const Duration(milliseconds: 1200),
              interval: const Duration(milliseconds: 300),
              color: Colors.grey.shade300,
              colorOpacity: 0.6,
              enabled: true,
              direction: direction,
              child: listViewWidget ?? ShimmerContainerWidget(
                height: shimmerContainerHeight ?? 60,
                width: shimmerContainerWidth,
                radius: shimmerContainerRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
