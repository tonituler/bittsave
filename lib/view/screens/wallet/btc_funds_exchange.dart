import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/view/screens/wallet/btc_transfer_confrimation.dart';

import '../../../controller/deposit_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../../util/color_resources.dart';
import '../../base/buttons.dart';
import '../home/funding_options/fund_bit_express.dart';
import '../home/funding_usd_wallet_page.dart';

class BTCFundsExcahnge extends StatefulWidget {
  const BTCFundsExcahnge({Key key}) : super(key: key);

  @override
  State<BTCFundsExcahnge> createState() => _BTCFundsExcahngeState();
}

class _BTCFundsExcahngeState extends State<BTCFundsExcahnge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtons(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                  child: BoldTextTitle(
                    data: 'How much do you want to send',
                    fontSize: 24.sp,
                  ),
                ),
                GetBuilder<SplashController>(
                  builder: (config) => Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 3.0, bottom: 10),
                    child: LightText(
                      text:
                          'Sending to \n u4rrkjlnxhkjasdhkasdk666666klmlkmkmlkm',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                  ),
                  height: 150,
                  width: double.maxFinite,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 45.sp,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              height: 80,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: "0.00"),
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //   '\$0.00',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.w700,
                        //     fontSize: 45.sp,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: LightText(
                              text: 'USD Bal: \$500.00', fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, right: 12, left: 0, bottom: 0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InnerContainer(
                          height: 50,
                          col: Colors.white,
                          data: 5,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Amount in BTC",
                                style: kLightTextStyle.copyWith(
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '0.0004440',
                                style: kLightTextStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 16.sp),
                              ),
                            ],
                          ),
                          style: kLightTextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: GetBuilder<DepositController>(
                            builder: (controller) {
                              return buttonWithBorder(
                                "Next",
                                textColor: Colors.white,
                                buttonColor: ColorResources.primaryColor,
                                fontSize: 18.sp,
                                busy: false,
                                fontWeight: FontWeight.w400,
                                height: 54.h,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return BTCTransferConfirmation();
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

  Widget LightText({String text, double fontSize}) {
    return Text(
      text,
      style: kLightTextStyle.copyWith(fontSize: fontSize ?? 12.sp),
    );
  }

  Widget InnerContainer(
      {double height,
      Color col,
      double data,
      String text,
      TextStyle style,
      Widget widget}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: col, borderRadius: BorderRadius.circular(data)),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
