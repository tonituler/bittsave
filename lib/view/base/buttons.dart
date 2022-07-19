import 'package:flutter/material.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/text_widgets.dart';

Widget buttonWithBorder(
  String text, {
  Color buttonColor,
   Color textColor,
  Function() onTap,
  Color borderColor,
  FontWeight fontWeight,
  double fontSize,
  double horiMargin,
  double borderRadius,
  double height,
  double width,
  bool busy = false,
  bool diabled = false,
}) {
  return InkWell(
    onTap: busy ? null : onTap,
    child: Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: horiMargin ?? 0),
      decoration: BoxDecoration(
        color: (diabled) ? ColorResources.pinkColors : buttonColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.h),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: Center(
        child: busy
            ? SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                height: 20.h,
                width: 20.h,
              )
            : regularText(
                text,
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
      ),
    ),
  );
}
