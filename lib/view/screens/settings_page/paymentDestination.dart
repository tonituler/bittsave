import 'package:flutter/material.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';
import 'addPayment_ACCOUNT.dart';

class PaymentDestination extends StatefulWidget {
  const PaymentDestination({Key key}) : super(key: key);

  @override
  State<PaymentDestination> createState() => _PaymentDestinationState();
}

class _PaymentDestinationState extends State<PaymentDestination> {
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
                  SizedBox(
                    height: 20,
                  ),
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Payment Destination',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                    child: Text(
                      'You may have to choose your preffered payment destination ',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0.5),
                    color: Colors.white,
                    child: getFunds(
                      widget: Image.asset(
                        'assets/newImages/naira.png',
                        scale: 3,
                      ),
                      title: "Nigeria (NGN)",
                      subTitle:
                          'You will be required to make a\nBank Transfer to your deposit',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPaymentAccount(
                              accountType: 'ngn',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0.5),
                    color: Colors.white,
                    child: getFunds(
                      widget: Image.asset(
                        'assets/image/dollar2.png',
                        height: 100,
                        width: 100,
                        // scale: 3,
                      ),
                      title: "Nigeria (USD)",
                      subTitle:
                          'You will be required to make a\nBank Transfer to your deposit',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPaymentAccount(
                              accountType: "usd",
                            ),
                          ),
                        );
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
