import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/wallet/sendBtcTo.dart';
import 'package:six_cash/view/screens/wallet/send_usd_to_friend.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class SendBTC extends StatefulWidget {
  const SendBTC({Key key}) : super(key: key);

  @override
  State<SendBTC> createState() => _BuyBTCState();
}

class _BuyBTCState extends State<SendBTC> {
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
                    child: Text('How do you want to send BTC?',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: getFunds(
                      widget: Icon(
                        Icons.currency_bitcoin_outlined,
                        color: Colors.white,
                      ),
                      title: "Send to BTC address",
                      subTitle:
                          'Send BTC to a wallet address directly from your USD wallet',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendBTCto()));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: getFunds(
                      widget: Icon(
                        Icons.currency_bitcoin_outlined,
                        color: Colors.white,
                      ),
                      title: "Send to Bittsave User",
                      subTitle: 'Send USD to other bitsave users',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendUsdToFriend()));
                      },
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
