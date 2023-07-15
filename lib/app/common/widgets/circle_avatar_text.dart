import 'package:flutter/material.dart';
import 'package:kotak_assignment/app/common/style/app_font_weight.dart';
import 'package:kotak_assignment/app/common/widgets/custom_text.dart';

class CircleAvatarText extends StatelessWidget {
  const CircleAvatarText(
      {Key? key,
      this.imageUrl,
      this.text,
      this.radius = 35,
      this.fontSize = 12.0,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  final String? imageUrl;
  final String? text;
  final double? radius;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: CircleAvatar(
        radius: radius,
        foregroundImage: imageUrl == null ? null : NetworkImage(imageUrl!),
        backgroundColor: backgroundColor,
        child: (text != null)
            ? Center(
                child: CustomText(
                  text: text,
                  color: textColor ?? Colors.white,
                  fontWeight: AppFontWeight.bold,
                  size: fontSize,
                ),
              )
            : null,
        //onForegroundImageError: (e,trace){/*....*/},
      ),
    );
  }
}
