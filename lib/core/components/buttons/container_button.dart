import 'package:flutter/material.dart';
import 'package:e_commerce_pos_sale/core/components/buttons/core_button.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class ContainerButton extends StatelessWidget {
  final String? buttonText;
  final bool isButtonIsTapped;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? width;
  final double? defaultLoaderWidth;
  final double? height;
  final double? defaultLoaderHeight;
  final double? borderRadius;
  final double? buttonFontSize;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final TextStyle? buttonTextStyle;
  final TextAlign? buttonTextAlign;
  final double? defaultLoaderStrokeWidth;
  final Color? defaultLoaderColor;
  final double? defaultLoaderRadius;
  final double? defaultLoaderValue;
  final Widget? defaultLoaderWidget;
  final Widget? buttonWidget;
  final double? elevation;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isDark;
  final void Function()? onPressed;

  const ContainerButton({
    super.key,
    this.buttonText,
    required this.isButtonIsTapped,
    this.buttonColor,
    this.buttonTextColor,
    this.onPressed,
    this.width,
    this.defaultLoaderWidth,
    this.height,
    this.defaultLoaderHeight,
    this.borderRadius,
    this.padding,
    this.buttonTextStyle,
    this.buttonTextAlign,
    this.decoration,
    this.defaultLoaderStrokeWidth,
    this.defaultLoaderColor,
    this.defaultLoaderRadius,
    this.defaultLoaderValue,
    this.defaultLoaderWidget,
    this.buttonWidget,
    this.elevation,
    this.overflow,
    this.maxLines,
    this.buttonFontSize,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 3,
      color: buttonColor ??
          (isDark ? buttonPrimaryColorForDarkMode : buttonPrimaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      child: CoreButton(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
        child: SizedBox(
          width: width ?? 150,
          height: height ?? 45,
          child: Center(
            child: isButtonIsTapped ? (
                defaultLoaderWidget ?? defaultLoader(
                  width: height == 35 ? 25 : (defaultLoaderWidth ?? 30),
                  height: height == 35 ? 25 : (defaultLoaderHeight ?? 30),
                  strokeWidth: defaultLoaderStrokeWidth ?? 3,
                  color:  defaultLoaderColor ?? (buttonColor == whiteColor ? primaryColor : whiteColor),
                  radius: defaultLoaderRadius,
                  value: defaultLoaderValue,
                )
            ) : (
                buttonWidget ?? Text(
                  buttonText ?? "",
                  maxLines: maxLines ?? 1,
                  textAlign: buttonTextAlign ?? TextAlign.center,
                  style: buttonTextStyle ?? AppTextTheme.text16.copyWith(
                    fontSize: buttonFontSize ?? 16,
                    color: buttonTextColor ?? (buttonColor == whiteColor ? primaryColor : whiteColor),
                    overflow: overflow ?? TextOverflow.ellipsis,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}