import 'package:flutter/material.dart';

import '../../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../../home/funding_usd_wallet_page.dart';
import '../../home/savings_pages/myPlans.dart';
import '../../settings_page/PaymentOptionComplete.dart';
import '../paymentDestination.dart';

class WithDrawPaymentOptions extends StatefulWidget {
  const WithDrawPaymentOptions({Key key}) : super(key: key);

  @override
  State<WithDrawPaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<WithDrawPaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BackGroundColr(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BackButtons(),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CompletePaymentOption()));
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
                    child: Text('Select a Withdrawal destination',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22)),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                        'Select the payment channel to which you would like us to send you funds.',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 13)),
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
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 7),
                  Center(
                    child: Text(
                      'You have not added any payment options',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.5, fontWeight: FontWeight.w400),
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
                              builder: (context) =>
                                  WithDrawPaymentDestination()));
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
