import 'package:flutter/material.dart';
import 'package:e_commerce_pos_sale/core/components/buttons/core_button.dart';

class DynamicImageCardButton extends StatelessWidget {
  final double size;
  final double radius;
  final double elevation;
  final EdgeInsets padding;
  final Alignment alignment;
  final String imagePath;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const DynamicImageCardButton({
    super.key,
    this.size = 45,
    this.radius = 12,
    this.elevation = 2,
    this.padding = const EdgeInsets.only(left: 40, top: 0),
    this.alignment = Alignment.centerLeft,
    required this.imagePath,
    this.onTap,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: alignment,
        child: CoreButton(
          onPressed: onTap,
          child: Card(
            elevation: elevation,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
