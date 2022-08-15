import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/profile/widget/appbar.dart';
import 'package:six_cash/view/screens/wallet/btc_funds_exchange.dart';

import '../home/funding_usd_wallet_page.dart';

class SendBTCto extends StatefulWidget {
  SendBTCto({Key key, @required this.type}) : super(key: key);
  String type;

  @override
  State<SendBTCto> createState() => _SendBTCtotate();
}

class _SendBTCtotate extends State<SendBTCto> {
  TextEditingController walletAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar.myAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 30),
                  child: Text('Send BTC to', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
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
                        controller: walletAddress,
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            height: 30,
                            width: 60,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  FlutterClipboard.paste().then((value) {
                                    setState(() {
                                      walletAddress.text = value;
                                    });
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.5,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  child: Text(
                                    'Paste',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          filled: true,
                          border: OutlineInputBorder(borderSide: BorderSide.none),
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
                              builder: (context) => BTCFundsExcahnge(
                                requestInfo: {
                                  "address": walletAddress.text,
                                  "type": widget.type,
                                },
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: Center(
                                child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            )),
                            decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
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
    );
  }
}
