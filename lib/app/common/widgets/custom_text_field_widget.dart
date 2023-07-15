import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kotak_assignment/app/common/style/app_border_style.dart';
import 'package:kotak_assignment/app/common/style/app_colors.dart';
import 'package:kotak_assignment/app/common/style/app_text_style.dart';
import 'package:kotak_assignment/app/common/style/dimens.dart';
import 'package:kotak_assignment/app/common/utils/validators.dart';

class CustomUnderlineTextFieldWithLabel extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int? minLines;
  final bool readOnly, addHint, enabled;
  final bool? isDense;
  final Function()? onTap;
  final InputBorder? border;
  final InputBorder? focussedBorder;
  final InputBorder? disableBorder;
  final AutovalidateMode autovalidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final Widget? rightWidgetToLabel;
  final Color? contentTextColor;
  final Color? labelTextColor;
  final double? labelFontSize;
  final Function? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool isObscure;
  final int? errorMaxLines;
  final bool autoFocus;
  final Color? enteredTextColor;
  final bool showHint;
  final bool showLabel;
  final List<TextInputFormatter>? inputFormatters;

  const CustomUnderlineTextFieldWithLabel(
      {Key? key,
      this.labelText,
      this.hintText,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.showHint = true,
      this.keyboardType = TextInputType.text,
      this.validator = Validators.validateEmpty,
      this.onChanged,
      this.onSaved,
      this.maxLength,
      this.maxLines,
      this.isObscure = false,
      this.minLines,
      this.initialValue,
      this.readOnly = false,
      this.onTap,
      this.focussedBorder = AppBorderStyle.underLineInputBorder,
      this.border = AppBorderStyle.underLineInputBorder,
      this.disableBorder = AppBorderStyle.disableUnderLineInputBorder,
      this.enabled = true,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.addHint = false,
      this.suffixIconConstraints,
      this.prefixText,
      this.suffixText,
      this.isDense,
      this.prefixIconPadding,
      this.fillColor,
      this.focusNode,
      this.rightWidgetToLabel,
      this.contentPadding,
      this.labelFontSize = 20.0,
      this.labelTextColor = AppColors.dropdownUnderlineColor,
      this.onFieldSubmitted,
      this.textInputAction,
      this.contentTextColor = AppColors.FF404040,
      this.errorMaxLines = 1,
      this.enteredTextColor,
      this.autoFocus = false,
      this.inputFormatters,
      this.showLabel = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle.regularStyle.copyWith(
      color: contentTextColor,
      fontSize: Dimens.fontSize15,
    );

    return IgnorePointer(
      ignoring: readOnly == true || enabled == false,
      child: Theme(
        data: ThemeData(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: TextFormField(
          autofocus: autoFocus,
          onFieldSubmitted: (_) =>
              onFieldSubmitted != null ? onFieldSubmitted!(_) : null,
          textInputAction: textInputAction,
          focusNode: focusNode,
          onTap: onTap,
          readOnly: readOnly,
          obscureText: isObscure,
          initialValue: initialValue,
          keyboardType: keyboardType,
          autovalidateMode: autovalidateMode,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          minLines: minLines,
          maxLines: maxLines,
          /*maxLength: maxLength,*/
          onSaved: onSaved,
          // enabled: enabled,
          cursorColor: AppColors.kPrimaryColor,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          inputFormatters: maxLength == null
              ? null
              : inputFormatters ??
                  [
                    LengthLimitingTextInputFormatter(maxLength),
                    if (keyboardType == TextInputType.number)
                      FilteringTextInputFormatter.digitsOnly,
                  ],
          style: AppTextStyle.regularStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: (readOnly || !enabled)
                  ? AppColors.FFB5B5B5
                  : enteredTextColor ?? AppColors.FF141414,
              fontSize: 16.0),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            /*  floatingLabelStyle: AppTextStyle.regularStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.dropdownUnderlineColor,
                fontSize: Dimens.fontSize14), */
            /*helperText: ' ',*/
            contentPadding: contentPadding,
            fillColor: fillColor,
            filled: fillColor != null,
            isDense: isDense,
            border:
                enabled ? border : AppBorderStyle.disableUnderLineInputBorder,
            labelText: showLabel ? labelText : null,
            enabledBorder:
                enabled ? border : AppBorderStyle.disableUnderLineInputBorder,
            focusedBorder: enabled
                ? focussedBorder
                : AppBorderStyle.disableUnderLineInputBorder,
            errorMaxLines: errorMaxLines,
            labelStyle: AppTextStyle.regularStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: (readOnly || !enabled)
                    ? AppColors.textDisabledColor
                    : labelTextColor,
                fontSize: 19.0),
            alignLabelWithHint: true,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: AppTextStyle.regularStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: (readOnly || !enabled)
                    ? AppColors.textDisabledColor
                    : AppColors.dropdownUnderlineColor,
                fontSize: 19.0),
            // alignLabelWithHint: maxLines == null,
            // labelText: addHint
            //     ? null
            //     : ((controller?.text != null || !readOnly) ? labelText : null),
            hintText: showHint ? hintText : "",
            hintStyle: AppTextStyle.regularStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: (readOnly || !enabled)
                    ? AppColors.textDisabledColor
                    : AppColors.FFB5B5B5,
                fontSize: 16.0),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: prefixIconPadding ?? const EdgeInsets.only(right: 10),
                    child: prefixIcon,
                  ),
            prefixText: prefixText,
            suffixText: suffixText,
            prefixStyle: textStyle,
            suffixStyle: textStyle,
            suffixIcon: suffixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: suffixIcon,
                  ),
            suffixIconConstraints: suffixIconConstraints ??
                const BoxConstraints(
                  maxHeight: 40,
                  maxWidth: 40,
                ),
          ),
        ),
      ),
    );
  }
}