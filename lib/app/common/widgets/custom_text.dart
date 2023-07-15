import 'package:flutter/material.dart';
import 'package:kotak_assignment/app/common/style/app_font_weight.dart';
import 'package:kotak_assignment/app/common/style/font_family.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? lineHeightToFontSizeRatio;

  const CustomText(
      {Key? key,
        @required this.text,
        this.size,
        this.color,
        this.textAlign,
        this.maxLines,
        this.lineHeightToFontSizeRatio,
        this.fontWeight = AppFontWeight.regular,
        this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          height: lineHeightToFontSizeRatio,
          color: color,
          fontSize: size,
          fontFamily: getFontFamily(fontWeight),
          fontWeight: fontWeight,
          decoration: TextDecoration.none),
    );
  }

  String getFontFamily(FontWeight? fontWeight) {
    if (fontWeight == AppFontWeight.semiBold) {
      return FontFamily.customBlack;
    } else if (fontWeight == AppFontWeight.bold || fontWeight == AppFontWeight.black) {
      return FontFamily.customBold;
    } else if (fontWeight == AppFontWeight.medium) {
      return FontFamily.customMedium;
    } else if (fontWeight == AppFontWeight.light) {
      return FontFamily.customLight;
    }
    return FontFamily.customMedium;
  }
}
