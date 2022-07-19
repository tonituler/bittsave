import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/settings_page/profileUpdate.dart';

import '../home/funding_usd_wallet_page.dart';

class CompletePaymentOption extends StatefulWidget {
  const CompletePaymentOption({Key key}) : super(key: key);

  @override
  State<CompletePaymentOption> createState() => _CompletePaymentOptionState();
}

class _CompletePaymentOptionState extends State<CompletePaymentOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Payment Options',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22)),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                        'Bank account and mobile money account can be found here',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 13)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20, right: 30),
                    padding: EdgeInsets.only(top: 10, left: 30, right: 10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            conText('Account Name', "Babalola Anthony A"),
                            SizedBox(height: 10),
                            conText('Bank Name', "Sterling Bank"),
                            SizedBox(height: 10),
                            conText('Account Name', "092929292929"),
                            SizedBox(height: 5),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileUpdate()));
                          },
                          child: Image.asset(
                            'assets/newImages/note.png',
                            scale: 20,
                          ),
                        )
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

  Widget conText(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$text1',
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        Text('$text2'),
      ],
    );
  }
}
