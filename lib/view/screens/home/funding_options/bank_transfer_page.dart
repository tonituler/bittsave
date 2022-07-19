import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/deposit_controller.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/home/funding_options/partner_information.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';

class BankTransferPage extends StatefulWidget {
  BankTransferPage({Key key, @required this.amountInDolar, @required this.amountInNaira}) : super(key: key);

  double amountInNaira;
  double amountInDolar;

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtons(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<DepositController>(
          builder: (controller) {
            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorResources.primaryColor,
                ),
              );
            }

            return Container(
              padding: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 30, left: 12),
                    child: BoldTextTitle(
                      data: 'How do you want to deposit?',
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  getFunds(
                    ontap: () async {
                      Response response = await controller.depositRequest(widget.amountInDolar);
                      if (response.body["message"] == "success") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PartnersInformation(
                                amountInDolar: widget.amountInDolar,
                                amountInNaira: widget.amountInNaira,
                              );
                            },
                          ),
                        );
                      }
                    },
                    widget: Container(
                      padding: EdgeInsets.all(8),
                      child: Image.asset('assets/newImages/TelegramLogo.png'),
                    ),
                    title: 'Bank Transfer',
                    subTitle: 'you will be requied to make a Bank\ntransfer to your deposit.',
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
