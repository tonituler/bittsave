import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/controller/wallet_controller.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/wallet/widget/confirmation.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class BTCTransferConfirmation extends StatefulWidget {
  BTCTransferConfirmation({Key key, @required this.requestInfo})
      : super(key: key);
  Map<String, dynamic> requestInfo;

  @override
  State<BTCTransferConfirmation> createState() =>
      _BTCTransferConfirmationState();
}

class _BTCTransferConfirmationState extends State<BTCTransferConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: GetBuilder<SplashController>(builder: (splashController) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 15),
                      child: Text('Transfer Confirmation',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorResources.primaryColor),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${widget.requestInfo["amount"]} USD',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Fees',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorResources.primaryColor),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${(double.parse(splashController.configModel.buyBtcFee) / 100) * double.parse(widget.requestInfo["amount"].toString())} USD',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Total Amount',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorResources.primaryColor),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${PriceConverter.priceFormater(balance: ((double.parse(splashController.configModel.buyBtcFee) / 100) * double.parse(widget.requestInfo["amount"].toString()) + double.parse(widget.requestInfo["amount"].toString())))} USD',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'BTC Address',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorResources.primaryColor),
                          ),
                          SizedBox(height: 5),
                          Text(
                            // '${PriceConverter.priceFormater(balance: (double.parse(splashController.configModel.sellBtcFee) + double.parse(widget.requestInfo["amount"].toString())))} USD',
                            'kljsahdkjasdhkjasdhkjasdh',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 12),
                      child:
                          GetBuilder<WalletController>(builder: (controller) {
                        return Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 35.w,
                          ),
                          child: buttonWithBorder(
                            'Payment Confirmed',
                            textColor: Colors.white,
                            buttonColor: ColorResources.primaryColor,
                            fontSize: 18.sp,
                            busy: controller.isLoading,
                            fontWeight: FontWeight.w400,
                            height: 54.h,
                            onTap: () async {
                              bool response = false;
                              if (widget.requestInfo["type"] == "USD") {
                                response = await controller.sendUSDToBTCWallet({
                                  ...widget.requestInfo,
                                });
                              } else {
                                response = await controller.sendBTCToWallet({
                                  ...widget.requestInfo,
                                });
                              }

                              if (response) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Confirmation(),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      }),
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
}
