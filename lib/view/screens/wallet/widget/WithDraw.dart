import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';

import '../../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../../home/funding_usd_wallet_page.dart';
import '../../home/savings_pages/myPlans.dart';
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
      body: BackGroundColr(
        child: SafeArea(
          child: GetBuilder<ProfileController>(builder: (profileController) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Select a Withdrawal destination',
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
                      'Select the payment channel to which you would like us to send you funds.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  if(profileController.userInfo.accountName == null || profileController.userInfo.accountName == "")
                  Column(
                    children: [
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WithDrawPaymentDestination()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
