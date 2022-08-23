import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/app/size_config/config.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/create_account_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/buttons.dart';

// import 'package:six_cash/view/base/custom_logo';

import '../../../base/custom_snackbar.dart';
import '../../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../../home/funding_usd_wallet_page.dart';
// import '../../home/funding_usd_wallet_page.dart';../../home/funding_usd_wallet_page.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController numberFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.find<CreateAccountController>()
        .setInitCountryCode(Get.find<SplashController>().getCountryCode());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: ColorResources.getWhiteAndBlack(),
      // appBar: CustomAppbar(title: 'login_registration'.tr),
      body: SafeArea(
        child: BackGroundColr(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BackButtons(),
                        const SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
                        // CustomLogo(
                        //     height: Dimensions.BIG_LOGO,
                        //     width: Dimensions.BIG_LOGO),
                        const SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'create_account_description'.tr,
                                'Welcome'.tr,
                                style: montserratRegular.copyWith(
                                  color: ColorResources.getPrimaryColor(),
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                // 'create_account_description'.tr,
                                'Enter your\nmobile number'.tr,
                                style: montserratRegular.copyWith(
                                    color: ColorResources.getBlackColor(),
                                    fontSize:
                                        Dimensions.FONT_SIZE_OVER_OVER_LARGE,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                // 'create_account_description'.tr,
                                'we will send you a confirmation code'.tr,
                                style: montserratRegular.copyWith(
                                    color: ColorResources.getGreyColor(),
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                        GetBuilder<CreateAccountController>(
                          builder: (controller) => Container(
                            height: 52,
                            margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Center(
                              child: TextField(
                                maxLength: 10,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                                controller: numberFieldController,
                                keyboardType: TextInputType.phone,
                                cursorColor:
                                    ColorResources.getPrimaryTextColor(),
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: "___ ___ ___ ___",
                                  hintStyle: TextStyle(
                                      fontSize:
                                          Dimensions.FONT_SIZE_EXTRA_LARGE,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey[400]),
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 0,
                                    top: 0,
                                  ),
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(
                                  //       Dimensions.RADIUS_SIZE_SMALL),
                                  //   borderSide: BorderSide.none,
                                  //   // borderSide: BorderSide(
                                  //   //   color: ColorResources.getPrimaryTextColor(),
                                  //   //   width: 2,
                                  //   // ),
                                  // ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.RADIUS_SIZE_SMALL),
                                      // borderSide: BorderSide(
                                      //   color: ColorResources.textFieldBorderColor,
                                      //   width: 1,
                                      // ),
                                      borderSide: BorderSide.none),
                                  prefixIcon: SizedBox(
                                    width: 55,
                                    height: 20,
                                    child: Row(
                                      children: [
                                        Container(
                                          // color: Colors.green,
                                          width: 50,
                                          height: 20,
                                          margin: const EdgeInsets.only(
                                              left: 0, bottom: 5),
                                          // decoration: const BoxDecoration(border: Border(right: BorderSide(width: 2, color: Colors.grey))),
                                          child: const Center(
                                              child: Text(
                                            "+234",
                                            style: TextStyle(
                                                fontSize: Dimensions
                                                    .FONT_SIZE_EXTRA_LARGE),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // prefixIcon: CustomCountryCodePiker(
                                  //   initSelect: controller.countryCode,

                                  //   onChanged: (code) => controller.setCountryCode(code),
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GetBuilder<AuthController>(
                builder: (controller) => Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  margin: EdgeInsets.only(bottom: 20),
                  child: buttonWithBorder(
                    'Verify Number',
                    textColor: Colors.white,
                    buttonColor: ColorResources.primaryColor,
                    fontSize: 18.sp,
                    busy: controller.isLoading,
                    fontWeight: FontWeight.w400,
                    height: 54.h,
                    onTap: () async {
                      String _phoneNumber =
                          '${Get.find<CreateAccountController>().countryCode}${numberFieldController.text}';
                      try {
                        await PhoneNumberUtil().parse(_phoneNumber).then(
                            (value) => Get.find<CreateAccountController>()
                                .sendOtpResponse(number: _phoneNumber));
                      } catch (e) {
                        showCustomSnackBar('please_input_your_valid_number'.tr,
                            isError: true);
                        numberFieldController.clear();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
