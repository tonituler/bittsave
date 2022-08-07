import 'package:flutter/material.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/text_widgets.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> list;
  final Function(String) onChanged;
  final String value;
  final String hintText;
  final String title;
  final bool busy;

  CustomDropDownButton({this.list, this.onChanged, this.value, this.hintText, this.title, this.busy = false});

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                children: [
                  regularText(widget.title, fontSize: 12.sp, color: Colors.grey),
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
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black,
                )
              )
            ),
            height: 50.h,
            alignment: Alignment.center,
            child: DropdownButton<String>(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                letterSpacing: 0.4,
              ),
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  widget.hintText,
                  style: TextStyle(
                    color: ColorResources.greyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              value: widget.value,
              underline: SizedBox(),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: ColorResources.primaryColor,
                size: 24.h,
              ),
              onChanged: widget.onChanged,
              items: widget.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(value, style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
