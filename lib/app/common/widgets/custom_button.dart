import 'package:flutter/material.dart';
import 'package:kotak_assignment/app/common/style/app_colors.dart';
import 'package:kotak_assignment/app/common/style/dimens.dart';
import 'package:kotak_assignment/app/common/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;
  final Color shadowColor;
  final String text;
  final Color textColor;
  final double? buttonWidth;
  final Color? borderColor;
  final double borderRadius;
  final FontWeight? fontWeight;
  final double? height;

  const CustomButton(
      {Key? key,
        this.onTap,
        this.color = AppColors.kPrimaryColor,
        this.shadowColor = AppColors.kPrimaryColor,
        this.textColor = Colors.white,
        this.buttonWidth,
        this.text = "Submit",
        this.borderColor,
        this.borderRadius = 25,
        this.fontWeight,
        this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: buttonWidth ?? double.infinity,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), color: color),
      child: ElevatedButton(
        onPressed: () {
          onTap?.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          side: BorderSide(color: borderColor ?? Colors.transparent),
          /*shadowColor: shadowColor,*/
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: CustomText(
          text: text,
          size: Dimens.fontSize16,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}