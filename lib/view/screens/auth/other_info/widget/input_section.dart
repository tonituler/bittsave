import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/view/base/custom_text_field.dart';

class InputSection extends StatefulWidget {
  final TextEditingController phoneController, 
  fNameController, 
  lNameController, 
  usernameController, 
  emailController;

  InputSection({
    Key key,
    this.phoneController,
    this.usernameController,
    this.fNameController,
    this.lNameController,
    this.emailController,
  }) : super(key: key);

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailNameFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_LARGE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First name"),
            CustomTextField(
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'first_name'.tr,
              isShowBorder: true,
              controller: widget.fNameController,
              focusNode: firstNameFocus,
              nextFocus: lastNameFocus,
              inputType: TextInputType.name,
              capitalization: TextCapitalization.words,
            ),
            const SizedBox(
              height: Dimensions.PADDING_SIZE_LARGE,
            ),
            Text("Last name"),
            CustomTextField(
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'last_name'.tr,
              isShowBorder: true,
              controller: widget.lNameController,
              focusNode: lastNameFocus,
              nextFocus: usernameFocus,
              inputType: TextInputType.name,
              capitalization: TextCapitalization.words,
            ),
            const SizedBox(
              height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE,
            ),
            Text("Username"),
            CustomTextField(
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'Username'.tr,
              isShowBorder: true,
              readOnly: false,
              controller: widget.usernameController,
              focusNode: usernameFocus,
              nextFocus: emailNameFocus,
              inputType: TextInputType.name,
              capitalization: TextCapitalization.words,
            ),
            const SizedBox(
              height: Dimensions.PADDING_SIZE_LARGE,
            ),
            Text("Email Address"),
                CustomTextField(
                  fillColor: Colors.grey.withOpacity(0.1),
                  hintText: 'type_email_address'.tr,
                  isShowBorder: true,
                  readOnly: true,
                  controller: widget.emailController,
                  focusNode: emailNameFocus,
                  nextFocus: phoneFocus,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
              height: Dimensions.PADDING_SIZE_LARGE,
            ),
            Text("Phone"),
                CustomTextField(
                  fillColor: Colors.grey.withOpacity(0.1),
                  hintText: 'Phone'.tr,
                  isShowBorder: true,
                  readOnly: true,
                  controller: widget.phoneController,
                  focusNode: phoneFocus,
                  inputType: TextInputType.emailAddress,
                ),
          ],
        ),
      );
    });
  }
}
