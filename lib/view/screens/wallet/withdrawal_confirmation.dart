import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/controller/wallet_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/screens/wallet/usd_withdrawal_confirmation.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class WitdrawalConfirmation extends StatefulWidget {
  WitdrawalConfirmation({Key key, @required this.requestInfo}) : super(key: key);
  Map<String, dynamic> requestInfo;

  @override
  State<WitdrawalConfirmation> createState() => _WitdrawalConfirmationState();
}

class _WitdrawalConfirmationState extends State<WitdrawalConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: GetBuilder<SplashController>(builder: (splashController) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 15),
                      child: Text('Transfer Confirmation', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(fontWeight: FontWeight.w400, color: ColorResources.primaryColor),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '${PriceConverter.priceFormater(balance: double.parse(widget.requestInfo["amount"].toString()))} USD',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 15),

                          Text(
                            'Fees',
                            style: TextStyle(fontWeight: FontWeight.w400, color: ColorResources.primaryColor),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '${PriceConverter.priceFormater(balance: (double.parse(splashController.configModel.buyBtcFee) / 100) * double.parse(widget.requestInfo["amount"].toString()))} USD',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Total Amount',
                            style: TextStyle(fontWeight: FontWeight.w400, color: ColorResources.primaryColor),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '${PriceConverter.priceFormater(balance: ((double.parse(splashController.configModel.buyBtcFee) / 100) * double.parse(widget.requestInfo["amount"].toString()) + double.parse(widget.requestInfo["amount"].toString())))} USD',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 15),
                          // Text(
                          //   'id',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w400,
                          //       color: ColorResources.primaryColor),
                          // ),
                          // SizedBox(height: 2),
                          // Text(
                          //   'asdlknahsdkjahsdkjad',
                          //   style: TextStyle(fontSize: 17),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GetBuilder<WalletController>(builder: (walletController) {
                      return Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 35.w,
                        ),
                        child: buttonWithBorder(
                          'Confirm Request',
                          textColor: Colors.white,
                          buttonColor: ColorResources.primaryColor,
                          fontSize: 18.sp,
                          busy: walletController.isLoadingWithdrawal,
                          fontWeight: FontWeight.w400,
                          height: 54.h,
                          onTap: () async {
                            await walletController.withdrawUSD(context, widget.requestInfo["amount"].toString(), widget.requestInfo["account_type"]);
                          },
                        ),
                      );
                    }),
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
