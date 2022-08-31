import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/deshboard/nav_bar.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import 'myPlans.dart';

class SuccessfullPage extends StatefulWidget {
  const SuccessfullPage({Key key}) : super(key: key);

  @override
  State<SuccessfullPage> createState() => _SuccessfullPageState();
}

class _SuccessfullPageState extends State<SuccessfullPage> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Center(
                    child: Text(
                  'Successful',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Text(
                    'Your BTC savings plan as been created, Watch as your saving is gaining',
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavBarScreen()));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
