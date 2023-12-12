import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/view/base/custom_text_field.dart';

class InputSection extends StatefulWidget {
  final TextEditingController phoneController, fNameController, lNameController, usernameController, emailController;

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
            SizedBox(
              height: 5,
            ),
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
            SizedBox(
              height: 5,
            ),
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
            SizedBox(
              height: 5,
            ),
            CustomTextField(
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'Username'.tr,
              isShowBorder: true,
              readOnly: true,
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
            SizedBox(
              height: 5,
            ),
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
            SizedBox(
              height: 5,
            ),
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

class InputSection2 extends StatefulWidget {
  final TextEditingController fNameController, lNameController, usernameController, emailController;

  InputSection2({
    Key key,
    this.usernameController,
    this.fNameController,
    this.lNameController,
    this.emailController,
  }) : super(key: key);

  @override
  State<InputSection2> createState() => _InputSection2State();
}

class _InputSection2State extends State<InputSection2> {
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailNameFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_LARGE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First name"),
            SizedBox(
              height: 5,
            ),
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
            SizedBox(
              height: 5,
            ),
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
            SizedBox(
              height: 5,
            ),
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
            SizedBox(
              height: 5,
            ),
            CustomTextField(
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'type_email_address'.tr,
              isShowBorder: true,
              readOnly: false,
              controller: widget.emailController,
              focusNode: emailNameFocus,
              nextFocus: emailNameFocus,
              inputType: TextInputType.emailAddress,
            ),
          ],
        ),
      );
    });
  }
}
