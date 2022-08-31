import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/deposit_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/screens/home/funding_options/partner_information.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';

class BankTransferPage extends StatefulWidget {
  BankTransferPage(
      {Key key, @required this.amountInDolar, @required this.amountInNaira})
      : super(key: key);

  double amountInNaira;
  double amountInDolar;

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: BackButtons(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 1, left: 20),
                  child: BoldTextTitle(
                    data: 'How do you want to deposit?',
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: getFunds(
                    ontap: () async {
                      Response response =
                          await controller.depositRequest(widget.amountInDolar);
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
                    widget: Image.asset(
                      'assets/image/TelegramLogo.png',
                    ),
                    title: 'Bank Transfer',
                    subTitle:
                        'You will be required to make\na bank transfer to any of our available partners.',
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
