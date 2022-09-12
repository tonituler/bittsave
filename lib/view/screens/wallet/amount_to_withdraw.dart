import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/view/screens/wallet/withdrawal_confirmation.dart';

import '../../../controller/deposit_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../../util/color_resources.dart';
import '../../base/buttons.dart';
import '../home/funding_options/fund_bit_express.dart';
import '../home/funding_usd_wallet_page.dart';

class AmounttoWithdraw extends StatefulWidget {
  const AmounttoWithdraw({Key key}) : super(key: key);

  @override
  State<AmounttoWithdraw> createState() => _AmounttoWithdrawState();
}

class _AmounttoWithdrawState extends State<AmounttoWithdraw> {
  TextEditingController amount = TextEditingController();
  double amountInNaira = 0.00;
  double amountInDolar = 0.00;
  String usdToNgn = "0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButtons(),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: GetBuilder<SplashController>(builder: (splashController) {
          return GetBuilder<ProfileController>(builder: (profileController) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 0, bottom: 10),
                      child: BoldTextTitle(
                        data: 'How much do you want to withdraw',
                        fontSize: 24.sp,
                      ),
                    ),
                    GetBuilder<SplashController>(
                      builder: (config) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 3.0, bottom: 0),
                        child: LightText(text: 'Exchange rate 1 USD = ${splashController.configModel.usdToNgn} NGN', fontSize: 13),
                      ),
                    ),
                    Container(
                      // height: 500,
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
                                          if (value.trim() != "" &&
                                              splashController.configModel.usdToNgn != null &&
                                              splashController.configModel.usdToNgn != "") {
                                            try {
                                              double val = double.parse(value.trim());
                                              double uToN = double.parse(splashController.configModel.usdToNgn);
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: LightText(
                                  txAlign: TextAlign.center,
                                  text: 'USD Bal: \$${PriceConverter.priceFormater(balance: profileController.userInfo.usdBalance)}',
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
                                    "you'll pay",
                                    style: kLightTextStyle.copyWith(color: Colors.pink),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'N${PriceConverter.priceFormater(balance: amountInNaira)}',
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
                                          return WitdrawalConfirmation(
                                            requestInfo: {
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
                    )
                    // Container(
                    //   margin: EdgeInsets.only(
                    //     top: 15,
                    //     bottom: 10,
                    //   ),
                    //   height: 150,
                    //   width: double.maxFinite,
                    //   child: Center(
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               '\$',
                    //               style: TextStyle(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 45.sp,
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               width: 10,
                    //             ),
                    //             SizedBox(
                    //               width: 150,
                    //               height: 80,
                    //               child: TextField(
                    //                 decoration: InputDecoration(
                    //                     border: InputBorder.none, hintText: "0.00"),
                    //                 style: TextStyle(
                    //                     fontSize: 45.sp,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         // Text(
                    //         //   '\$0.00',
                    //         //   style: TextStyle(
                    //         //     color: Colors.black,
                    //         //     fontWeight: FontWeight.w700,
                    //         //     fontSize: 45.sp,
                    //         //   ),
                    //         // ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(2.0),
                    //           child: LightText(
                    //               text: 'USD Bal: \$500.00', fontSize: 12.sp),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(
                    //       top: 10.0, right: 12, left: 0, bottom: 0),
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.black),
                    //   child: Center(
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         InnerContainer(
                    //           height: 50,
                    //           col: Colors.white,
                    //           data: 5,
                    //           widget: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(
                    //                 "You will pay",
                    //                 style: kLightTextStyle.copyWith(
                    //                     color: Colors.grey),
                    //               ),
                    //               SizedBox(height: 2),
                    //               Text(
                    //                 '0.0004440',
                    //                 style: kLightTextStyle.copyWith(
                    //                     fontWeight: FontWeight.w400,
                    //                     color: Colors.black,
                    //                     fontSize: 16.sp),
                    //               ),
                    //             ],
                    //           ),
                    //           style: kLightTextStyle,
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.symmetric(horizontal: 5.w),
                    //           child: GetBuilder<DepositController>(
                    //             builder: (controller) {
                    //               return buttonWithBorder(
                    //                 "Next",
                    //                 textColor: Colors.white,
                    //                 buttonColor: ColorResources.primaryColor,
                    //                 fontSize: 18.sp,
                    //                 busy: false,
                    //                 fontWeight: FontWeight.w400,
                    //                 height: 54.h,
                    //                 onTap: () async {
                    //                   Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                         builder: (context) =>
                    //                             WitdrawalConfirmation()),
                    //                   );
                    //                 },
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          });
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
