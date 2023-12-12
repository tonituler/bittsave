import 'package:flutter/material.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/text_widgets.dart';

enum DropDownType { Bordered, Underline, None }

class CustomDropDownButton extends StatefulWidget {
  final List<String> list;
  final Function(String) onChanged;
  final String value;
  final String hintText;
  final String title;
  final bool busy;
  final DropDownType bordered;
  final Color backgroundColor;
  final Color borderColor;

  CustomDropDownButton({
    this.list,
    this.onChanged,
    this.value,
    this.hintText,
    this.title,
    this.busy = false,
    this.bordered = DropDownType.Underline,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
  });

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin: EdgeInsets.only(top: 2.h, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Row(
              children: [
                regularText(
                  widget.title,
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  // color: ColorResources.greyColor,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                if (widget.busy)
                  SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                    height: 14.h,
                    width: 14.h,
                  )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
            ),
            decoration: getDecoration(),
            height: 60,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: DropdownButton<String>(
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.FONT_SIZE_LARGE,
                letterSpacing: 0.4,
              ),
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  widget.hintText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              value: widget.value,
              underline: SizedBox(),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                // color: ColorResources.primaryColor,
                size: 24.h,
              ),
              onChanged: widget.onChanged,
              items: widget.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration getDecoration() {
    if (widget.bordered == DropDownType.Bordered) {
      return BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: widget.borderColor,
          style: BorderStyle.solid,
        ),
      );
    }

    if (widget.bordered == DropDownType.Underline) {
      return BoxDecoration(
        color: widget.backgroundColor,
        border: Border(
          bottom: BorderSide(
            width: 1.h,
            color: widget.borderColor,
          ),
        ),
      );
    }
    return BoxDecoration(
      color: widget.backgroundColor,
    );
  }
}
