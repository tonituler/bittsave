import 'package:flutter/material.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import '../home_screen.dart';
import 'myPlans.dart';

class SuccessfullPage extends StatefulWidget {
  const SuccessfullPage({Key key}) : super(key: key);

  @override
  State<SuccessfullPage> createState() => _SuccessfullPageState();
}

class _SuccessfullPageState extends State<SuccessfullPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BackGroundColr(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackButtons(),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Center(
              child: Text(
            'Successful',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Text(
              'Your, account have been credited, you can now check your wallet balance',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: newContTap(
            col: Colors.pink,
            text: 'Back to Home',
            ontap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
      ],
    ))));
  }
}
