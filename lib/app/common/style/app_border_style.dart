import 'package:flutter/material.dart';
import 'package:kotak_assignment/app/common/style/app_colors.dart';

class AppBorderStyle {
  const AppBorderStyle._();
  static  const InputBorder underLineInputBorder = UnderlineInputBorder(
      borderSide:
          BorderSide(color: AppColors.dropdownUnderlineColor, width: 2.0));
  static const InputBorder disableUnderLineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.FFB5B5B5, width: 2.0));
}
