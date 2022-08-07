import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/wallet/btc_sell_confirmation_successfull.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class BTCSellconfrimation extends StatefulWidget {
  const BTCSellconfrimation({Key key}) : super(key: key);

  @override
  State<BTCSellconfrimation> createState() => _BTCSellconfrimationState();
}

class _BTCSellconfrimationState extends State<BTCSellconfrimation> {
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
                    padding: const EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('Confirmation',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '9000.00 USD',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Amount in BTC',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '0.000431 USD',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Fees',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '500 USD',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Total Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '300.00 USD',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BTCSellConfirmationSuccess()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 12),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                            child: Text(
                          'Confirm Request',
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
          ),
        ),
      ),
    );
  }
}
