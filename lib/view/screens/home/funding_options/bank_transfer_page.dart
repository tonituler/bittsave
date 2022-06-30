import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/home/funding_options/partner_information.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';

class BankTransferPage extends StatefulWidget {
  const BankTransferPage({Key key}) : super(key: key);

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
        child: Container(
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
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PartnersInformation();
                      },
                    ),
                  );
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
        ),
      ),
    );
  }
}
