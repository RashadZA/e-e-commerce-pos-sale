import 'package:flutter/material.dart';
import 'package:e_commerce_pos_sale/core/components/buttons/core_button.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class CustomDeleteButton extends StatelessWidget {
  final String? buttonText;
  final bool isButtonIsTapped;
  final Color? buttonColor;
  final double? width;
  final double? defaultLoaderWidth;
  final double? height;
  final double? defaultLoaderHeight;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final double? defaultLoaderStrokeWidth;
  final Color? defaultLoaderColor;
  final double? defaultLoaderRadius;
  final double? defaultLoaderValue;
  final Widget? defaultLoaderWidget;
  final double? elevation;
  final void Function()? onPressed;

  const CustomDeleteButton({
    super.key,
    this.buttonText,
    required this.isButtonIsTapped,
    this.buttonColor,
    this.onPressed,
    this.width,
    this.defaultLoaderWidth,
    this.height,
    this.defaultLoaderHeight,
    this.borderRadius,
    this.padding,
    this.decoration,
    this.defaultLoaderStrokeWidth,
    this.defaultLoaderColor,
    this.defaultLoaderRadius,
    this.defaultLoaderValue,
    this.defaultLoaderWidget,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: elevation ?? 3,
      color: deleteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      child: CoreButton(
        onPressed: onPressed,
        child: SizedBox(
          width: width ?? 35,
          height: height ?? 35,
          child: Center(
            child: isButtonIsTapped ? (
                defaultLoaderWidget ?? defaultLoader(
                  width: height == 35 ? 25 : (defaultLoaderWidth ?? 30),
                  height: height == 35 ? 25 : (defaultLoaderHeight ?? 30),
                  strokeWidth: defaultLoaderStrokeWidth ?? 3,
                  color: defaultLoaderColor ?? whiteColor,
                  radius: defaultLoaderRadius,
                  value: defaultLoaderValue,
                )
            ) : Icon(
              Icons.delete,
              size: 25,
              color: buttonIconPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}