import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/wallet/btc_funds_exchange.dart';

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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  BackButtons(),
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
                            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
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
                                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    child: Text(
                                      'Paste',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
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
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 1),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Continue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(8),
                              ),
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
