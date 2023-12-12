import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/styles.dart';
import 'package:bittsave/view/base/custom_app_bar.dart';
import 'package:bittsave/view/base/custom_loader.dart';
import 'package:bittsave/view/base/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePinScreen extends StatefulWidget {
  ChangePinScreen({Key key}) : super(key: key);

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _oldPinFocus = FocusNode();
  final FocusNode _newPinFocus = FocusNode();
  final FocusNode _confirmPinFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorResources.getBackgroundColor(),
          appBar: CustomAppbar(title: ''.tr),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 0, bottom: 0),
                    child: Text(
                      'pin_change'.tr,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.RADIUS_SIZE_EXTRA_EXTRA_LARGE),
                    child: Text(
                      'set_your_4_digit_PIN_for_future_login'.tr,
                      textAlign: TextAlign.center,
                      style: montserratMedium.copyWith(color: ColorResources.getPrimaryTextColor(), fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                  ),
                  CustomPasswordField(
                    controller: _oldPasswordController,
                    focusNode: _oldPinFocus,
                    isPassword: true,
                    isShowSuffixIcon: true,
                    isIcon: false,
                    hint: 'old_password'.tr,
                    letterSpacing: 10.0,
                    nextFocus: _newPinFocus,
                    fillColor: Colors.grey.withOpacity(0.1),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  CustomPasswordField(
                    controller: _newPasswordController,
                    focusNode: _newPinFocus,
                    nextFocus: _confirmPinFocus,
                    hint: 'new_password'.tr,
                    isShowSuffixIcon: true,
                    isPassword: true,
                    isIcon: false,
                    textAlign: TextAlign.start,
                    letterSpacing: 10.0,
                    fillColor: Colors.grey.withOpacity(0.1),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  CustomPasswordField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPinFocus,
                    textInputAction: TextInputAction.done,
                    hint: 'confirm_password'.tr,
                    isShowSuffixIcon: true,
                    isPassword: true,
                    isIcon: false,
                    letterSpacing: 10.0,
                    textAlign: TextAlign.start,
                    fillColor: Colors.grey.withOpacity(0.1),
                  ),
                  const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
                    child: buttonWithBorder(
                      'Save change',
                      textColor: Colors.white,
                      buttonColor: ColorResources.primaryColor,
                      fontSize: 18.sp,
                      busy: controller.isLoading,
                      fontWeight: FontWeight.w400,
                      height: 54.h,
                      onTap: () async {
                        controller.changePin(
                            oldPassword: _oldPasswordController.text,
                            confirmPassword: _confirmPasswordController.text,
                            newPassword: _newPasswordController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
