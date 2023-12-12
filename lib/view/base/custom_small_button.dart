import 'package:flutter/material.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/styles.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  CustomSmallButton({
    this.backgroundColor,
    @required this.onTap,
    this.text,
    @required this.textColor,
    this.textSize = Dimensions.FONT_SIZE_LARGE,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(width: 1, color: ColorResources.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_SMALL)),
        padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: montserratRegular.copyWith(
            color: textColor,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
  //Dimensions.FONT_SIZE_EXTRA_LARGE
}
