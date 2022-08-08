import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/wallet/btc_funds_exchange.dart';

import '../home/funding_usd_wallet_page.dart';

class SendBTCto extends StatefulWidget {
  const SendBTCto({Key key}) : super(key: key);

  @override
  State<SendBTCto> createState() => _SendBTCtotate();
}

class _SendBTCtotate extends State<SendBTCto> {
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
                    padding: const EdgeInsets.only(left: 8, bottom: 30),
                    child: Text('Send BTC to',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BTC Destination',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            label: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all(
                                        color: Colors.white, width: 2.5)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Text(
                                  'Paste',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            filled: true,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            fillColor: Colors.grey[200],
                          ),
                        ),
                        SizedBox(height: 30),
                        Text('Your recipient must have a valid BTC wallet '),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BTCFundsExcahnge()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 12),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              child: Center(
                                  child: Text(
                                'Continue',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ],
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
