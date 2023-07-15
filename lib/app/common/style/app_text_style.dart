import 'package:flutter/material.dart';
import 'package:kotak_assignment/app/common/style/app_colors.dart';
import 'package:kotak_assignment/app/common/style/dimens.dart';
import 'package:kotak_assignment/app/common/style/font_family.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize16,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.customBold);

  static final TextStyle boldStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize22,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.customBold);

  static TextStyle regularStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize14,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.customMedium,
      color: AppColors.FF000000.withOpacity(0.65));

  static TextStyle lightStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w300,
    fontFamily: FontFamily.customLight,
    color: AppColors.FF707070,
  );

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.customMedium,
  );

  static const TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimens.fontSize14,
    fontFamily: FontFamily.customMedium,
  );

  static const TextStyle hintTextStyle = TextStyle(
    color: Colors.black26,
    fontSize: Dimens.fontSize14,
    fontFamily: FontFamily.customMedium,
  );

  static const TextStyle hintFocusTextStyle = TextStyle(
    color: AppColors.FF1E7B74,
    fontSize: Dimens.fontSize14,
    fontFamily: FontFamily.customMedium,
  );
}
