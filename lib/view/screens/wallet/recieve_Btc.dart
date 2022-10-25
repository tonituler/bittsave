import 'package:flutter/material.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class ReceiveBtc extends StatefulWidget {
  const ReceiveBtc({Key key}) : super(key: key);

  @override
  State<ReceiveBtc> createState() => _ReceiveBtcState();
}

class _ReceiveBtcState extends State<ReceiveBtc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 10),
                    child: Text('How do you want to receive BTC?',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: getFunds(
                      widget: Image.asset("assets/image/bitc.png", scale: 2),
                      title: "Receive via Lightning",
                      subTitle:
                          'Send BTC to a wallet address directly from your USD wallet',
                      ontap: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: getFunds(
                      widget: Image.asset("assets/image/bitc.png", scale: 2),
                      title: "Lightning Address",
                      subTitle: 'Send USD to other bitsave users',
                      ontap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
