import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/create_account_controller.dart';
import 'package:six_cash/controller/varification_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';

class TimerSection extends StatelessWidget {
  const TimerSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VarificationController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: controller.visibility == true ? true : false,
              child: InkWell(
                onTap: () {
                  controller.startTimer();
                  controller.setVisibility(false);
                  Get.find<AuthController>().resendOtp(
                      phoneNumber:
                          Get.find<CreateAccountController>().phoneNumber);
                },
                child: Row(
                  children: [
                    Text(
                      'Didn\'t receive an SMS?  '.tr,
                      style: montserratMedium.copyWith(
                          color: ColorResources.getGreyColor(),
                          fontSize: Dimensions.FONT_SIZE_DEFAULT),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'resend'.tr,
                      style: montserratMedium.copyWith(
                          color: ColorResources.getBlackColor(),
                          fontSize: Dimensions.FONT_SIZE_LARGE),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: controller.visibility == true ? false : true,
              child: Text(
                'resend_OTP_in'.tr +
                    '${controller.maxSecond}' +
                    " " +
                    'seconds'.tr,
                style: montserratRegular.copyWith(
                    color: ColorResources.getOnboardGreyColor(),
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    });
  }
}
