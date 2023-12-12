import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/controller/create_account_controller.dart';
import 'package:bittsave/controller/varification_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/custom_pin_code_field.dart';
import 'package:bittsave/view/base/demo_otp_hint.dart';
import 'package:bittsave/view/screens/auth/varification/widget/information_section.dart';
import 'package:bittsave/view/screens/auth/varification/widget/timer_section.dart';

// import 'package:bittsave/view/screens/auth/varification/widget/timer_section_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

import '../../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../../home/funding_usd_wallet_page.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getWhiteAndBlack(),
      // appBar: CustomAppbar(
      //     title: 'phone_verification'.tr,
      //     onTap: () {
      //       Get.find<VarificationController>().cancelTimer();
      //       Get.back();
      //       // Get.toNamed(RouteHelper.getChoseLoginRegRoute());
      //     }),
      body: SafeArea(
        child: BackGroundColr(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BackButtons(),
                        const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                        InformationSection(),
                        const SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GetBuilder<VarificationController>(builder: (getController) {
                            return CustomPinCodeField(
                              padding: Dimensions.PADDING_SIZE_OVER_LARGE,
                              onCompleted: (pin) {
                                getController.setOtp(pin);
                                String _phoneNumber = Get.find<CreateAccountController>().phoneNumber;
                                Get.find<AuthController>().phoneVerify(_phoneNumber, pin);
                              },
                            );
                          }),
                        ),
                        DemoOtpHint(),
                        const SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                        TimerSection(),
                      ],
                    ),
                  ),
                ),
                GetBuilder<AuthController>(
                    builder: (controller) => Container(
                          height: 100,
                          child: controller.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                                )
                              : Container(),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
