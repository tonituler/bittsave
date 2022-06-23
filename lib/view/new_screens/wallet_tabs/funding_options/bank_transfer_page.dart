import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/partner_information.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_usd_wallet_page.dart';

class BankTransferPage extends StatefulWidget {
  const BankTransferPage({Key key}) : super(key: key);

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: BackButtons(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 30, left: 12),
                child: BoldTextTitle(
                  data: 'How do you want to deposit?',
                ),
              ),
              SizedBox(
                height: 70,
              ),
              getFunds(
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PartnersInformation();
                  }));
                },
                icon: Icons.send_outlined,
                title: 'Bank Transfer',
                subTitle:
                    'you will be requied to make a Bank\ntransfer to your deposit.',
              )
            ],
          ),
        ),
      ),
    );
  }
}
