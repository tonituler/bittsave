import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/deposit_controller.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/screens/home/funding_options/bank_transfer_page.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';

const kLightTextStyle = TextStyle(
  color: Colors.pinkAccent,
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w300,
);

class FundBitExpress extends StatefulWidget {
  const FundBitExpress({Key key}) : super(key: key);

  @override
  State<FundBitExpress> createState() => _FundBitExpressState();
}

class _FundBitExpressState extends State<FundBitExpress> {
  TextEditingController amount = TextEditingController();
  double amountInNaira = 0.00;
  double amountInDolar = 0.00;
  String usdToNgn = "0.00";

  @override
  Widget build(BuildContext context) {
    usdToNgn = Get.find<SplashController>().configModel.usdToNgn;
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButtons(),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                BackButtons(),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 1, bottom: 10),
                  child: BoldTextTitle(
                    data: 'How much do you want to deposit?',
                    fontSize: 24.sp,
                  ),
                ),
                GetBuilder<SplashController>(
                  builder: (config) => Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 30.0, bottom: 0),
                    child: LightText(
                      txAlign: TextAlign.center,
                      col: ColorResources.primaryColor,
                      text: 'Exchange rate: 1USD = ${config.configModel.usdToNgn} NGN',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0.0, right: 0, left: 0, bottom: 0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.pink),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '\$',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 47.sp,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "0.00",
                                        contentPadding: EdgeInsets.only(left: 2, bottom: 0, right: 0),
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 52.sp,
                                        )),
                                    controller: amount,
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      // print(usdToNgn);
                                      if (value.trim() != "" && usdToNgn != null && usdToNgn != "") {
                                        try {
                                          double val = double.parse(value.trim());
                                          double uToN = double.parse(usdToNgn);
                                          amountInNaira = val * uToN;
                                          amountInDolar = val;
                                          setState(() {});
                                        } catch (e) {}
                                      }
                                    },
                                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 52.sp, color: Colors.white),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 150,
                                //   // height: 50,
                                //   child: TextField(
                                //     decoration: InputDecoration(
                                //         border: InputBorder.none,
                                //         hintText: "0.00",
                                //         contentPadding: EdgeInsets.only(
                                //             left: 2, bottom: 0, right: 0),
                                //         hintStyle: TextStyle(
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.w900,
                                //           fontSize: 52.sp,
                                //         )),
                                //     controller: amount,
                                //     keyboardType: TextInputType.number,
                                //     onChanged: (String value) {
                                //       // print(usdToNgn);
                                //       if (value.trim() != "" &&
                                //           usdToNgn != null &&
                                //           usdToNgn != "") {
                                //         try {
                                //           double val =
                                //               double.parse(value.trim());
                                //           double uToN = double.parse(usdToNgn);
                                //           amountInNaira = val * uToN;
                                //           amountInDolar = val;
                                //           setState(() {});
                                //         } catch (e) {}
                                //       }
                                //     },
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.w900,
                                //         fontSize: 52.sp,
                                //         color: Colors.white),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        GetBuilder<ProfileController>(builder: (profileController) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: LightText(
                              txAlign: TextAlign.center,
                              text: 'USD Bal: \$${PriceConverter.priceFormater(balance: profileController.userInfo.usdBalance)}',
                              fontSize: 12.sp,
                              col: ColorResources.whiteColor,
                            ),
                          );
                        }),
                        InnerContainer(
                          height: 50,
                          col: Colors.white,
                          data: 5,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "you'll pay",
                                style: kLightTextStyle.copyWith(color: Colors.pink),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'N$amountInNaira',
                                style: kLightTextStyle.copyWith(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16.sp),
                              ),
                            ],
                          ),
                          style: kLightTextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.w),
                          child: GetBuilder<DepositController>(
                            builder: (controller) {
                              return buttonWithBorder(
                                'Continue',
                                textColor: Colors.white,
                                buttonColor: ColorResources.blackColor,
                                fontSize: 18.sp,
                                busy: false,
                                fontWeight: FontWeight.w400,
                                height: 54.h,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (contet) {
                                      return BankTransferPage(
                                        amountInDolar: amountInDolar,
                                        amountInNaira: amountInNaira,
                                      );
                                    }),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget LightText({String text, double fontSize, @required TextAlign txAlign, @required Color col}) {
    return Text(
      text,
      textAlign: txAlign,
      style: kLightTextStyle.copyWith(
        fontSize: fontSize ?? 12.sp,
        color: col,
      ),
    );
  }

  Widget InnerContainer({double height, Color col, double data, String text, TextStyle style, Widget widget}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(data)),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
