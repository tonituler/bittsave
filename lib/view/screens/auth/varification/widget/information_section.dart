import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/create_account_controller.dart';
import 'package:six_cash/controller/varification_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
// import 'package:six_cash/view/base/custom_logodget ';

class InformationSection extends StatelessWidget {
  const InformationSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomLogo(
          //   height: Dimensions.BIG_LOGO,
          //   width: Dimensions.BIG_LOGO,
          // ),
          const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
          // CustomLogo(
          //     height: Dimensions.BIG_LOGO,
          //     width: Dimensions.BIG_LOGO),
          const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Text(
              'Enter code sent\nto your number'.tr,
              style: montserratMedium.copyWith(
                color: ColorResources.getBlackColor(),
                fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              'we have send the code verification to \nyour mobile number'.tr,
              style: montserratLight.copyWith(
                color: ColorResources.getBlackColor(),
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE,
          ),
          GetBuilder<CreateAccountController>(
            builder: (controller) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.phoneNumber,
                  style: montserratRegular.copyWith(
                    color: ColorResources.getBlackColor(),
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                InkWell(
                  // onTap: ()=> Get.back(),
                  onTap: () {
                    Get.back();
                    Get.find<VarificationController>().cancelTimer();
                    Get.find<VarificationController>().setVisibility(false);

                    // Get.offNamed(RouteHelper.getRegistrationRoute(phoneNumber: controller.phoneNumber.substring(4)));
                  },
                  child: Text(
                    'change_number'.tr,
                    style: montserratRegular.copyWith(
                      decoration: TextDecoration.underline,
                      color: ColorResources.getBlackColor(),
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
