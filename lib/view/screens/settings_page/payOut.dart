import 'package:flutter/material.dart';

import '../../../util/dimensions.dart';
import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class PayOut extends StatefulWidget {
  const PayOut({Key key}) : super(key: key);

  @override
  State<PayOut> createState() => _PayOutState();
}

class _PayOutState extends State<PayOut> {
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
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Payouts',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                    child: Text(
                      'With payouts, you can choose how and where you want you BTC payment to be settled. This is caters'
                      'for BTC received via wallet address',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'How would you liked this settled?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        ContJ(
                          Image.asset('assets/newImages/Dollar.png'),
                          'Usd Wallet',
                          'You can have your money settled in USD. Take note of the price changes in Bitcoin.',
                          Colors.pink,
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.pink[50],
                            child: Icon(
                              Icons.check,
                              color: Colors.pink,
                              size: 16,
                            ),
                          ),
                        ),
                        ContJ(
                          Icon(Icons.currency_bitcoin_outlined,
                              color: Colors.white),
                          'BTC Wallet',
                          'You can have your money settled in USD. Take note of the price changes in Bitcoin.',
                          Colors.transparent,
                          ContJ2(),
                        ),
                        ContJ(
                            Image.asset('assets/newImages/Bank.png'),
                            'Direct tpo Bank',
                            'All BTC inflow will be converted and sent to your prefeered account',
                            Colors.transparent,
                            ContJ2()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ContJ(
      Widget child, String text1, String text2, Color col, Widget child2) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: col, width: 0.8),
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pink,
          radius: 16,
          child: child,
        ),
        title: Text(
          text1,
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          text2,
          style: TextStyle(fontSize: 11.5),
        ),
        trailing: child2,
      ),
    );
  }

  Widget ContJ2() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.pink, width: 1)),
    );
  }
}
