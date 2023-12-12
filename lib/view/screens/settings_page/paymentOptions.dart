import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/settings_page/paymentDestination.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';
import '../home/savings_pages/myPlans.dart';
import 'PaymentOptionComplete.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key key}) : super(key: key);

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      BackButtons(),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompletePaymentOption(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.check,
                            color: Colors.pink,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Payment Options',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Bank account and mobile money account can be found here',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: Image.asset(
                      'assets/newImages/Take a Loan 2.png',
                      scale: 0.9,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'No payment options',
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 7),
                  Center(
                    child: Text(
                      'You have not added any payment options',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 20),
                  newContTap(
                    col: Colors.pink,
                    text: 'Add new account',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentDestination(),
                        ),
                      );
                    },
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
