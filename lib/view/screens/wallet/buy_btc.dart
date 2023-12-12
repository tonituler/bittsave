import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/helper/price_converter.dart';

import '../../../controller/deposit_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../../util/color_resources.dart';
import '../../base/buttons.dart';
import '../home/funding_options/fund_bit_express.dart';
import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';
import 'btc_buy_confirmation.dart';

class BuyBTC extends StatefulWidget {
  const BuyBTC({Key key}) : super(key: key);

  @override
  State<BuyBTC> createState() => _BuyBTCState();
}

class _BuyBTCState extends State<BuyBTC> {
  TextEditingController amount = TextEditingController();
  double amountInNaira = 0.00;
  double amountInDolar = 0.00;
  String usdToNgn = "0.00";

  @override
  Widget build(BuildContext context) {
    usdToNgn = Get.find<SplashController>().configModel.usdToNgn;
    return Scaffold(
      body: BackGroundColr(
        child: GetBuilder<ProfileController>(builder: (profileController) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 2),
                      child: BoldTextTitle(
                        data: 'Buy Bitcoin',
                        fontSize: 24.sp,
                      ),
                    ),
                    GetBuilder<SplashController>(
                      builder: (config) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 3.0, bottom: 10),
                        child: LightText(
                          text: 'How much bitcoin would you like to buy?',
                        ),
                      ),
                    ),
                    Container(
                      // height: 500,
                      margin: const EdgeInsets.only(top: 50.0, right: 20, left: 0, bottom: 0),
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
                                          if (value.trim() != "" && usdToNgn != null && usdToNgn != "") {
                                            try {
                                              double val = double.parse(value.trim());
                                              double uToN = double.parse(usdToNgn);
                                              amountInNaira = val * uToN;
                                              amountInDolar = val;
                                              setState(() {});
                                            } catch (e) {}
                                          } else {
                                            amountInNaira = 0.0;
                                            amountInDolar = 0.0;
                                            setState(() {});
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: LightText(
                                  txAlign: TextAlign.center,
                                  text:
                                      // 'Available BTC Bal: \$${PriceConverter.priceFormater(balance: PriceConverter.converBTCToDolar(profileController.userInfo.btcBalance - profileController.userInfo.btcCollateralUsed))}',
                                      'Available USD Bal: \$${PriceConverter.priceFormater(balance: profileController.userInfo.usdBalance)}',
                                  fontSize: 12.sp,
                                  col: ColorResources.whiteColor),
                            ),
                            InnerContainer(
                              height: 50,
                              col: Colors.white,
                              data: 5,
                              widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Amount in BTC",
                                    style: kLightTextStyle.copyWith(color: Colors.pink),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '${PriceConverter.converDolarToBTC(amountInDolar)}BTC',
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
                                        MaterialPageRoute(builder: (context) {
                                          return BTCBuyConfirmation(
                                            requestInfo: {
                                              "amount_btc": PriceConverter.converDolarToBTC(amountInDolar),
                                              "amount": amountInDolar,
                                            },
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
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget LightText({String text, double fontSize, TextAlign txAlign, Color col}) {
    return Text(
      text,
      textAlign: txAlign,
      style: kLightTextStyle.copyWith(fontSize: fontSize ?? 12.sp, color: col),
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
