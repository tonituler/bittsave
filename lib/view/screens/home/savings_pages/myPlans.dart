import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/savings_pages/start_saving_page.dart';

import '../funding_usd_wallet_page.dart';

class MyPlans extends StatefulWidget {
  const MyPlans({Key key}) : super(key: key);

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: BackButtons(),
                ),
                Text('My Plans',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22)),
                SizedBox(height: 8),
                Text('Check how your savings is gaining',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
                SizedBox(height: 70),
                Center(
                  child: Image.asset(
                    'assets/newImages/Take a Loan.png',
                    scale: 0.7,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'No active plans',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 7),
                Center(
                  child: Text(
                    'you\'ve not created a plan, but thats about to change. Just tap the button below',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20),
                newContTap(
                  col: Colors.pink,
                  text: 'Create a plan',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StartSavingPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class newContTap extends StatelessWidget {
  const newContTap({
    this.col,
    this.text,
    this.ontap,
    Key key,
  }) : super(key: key);

  final Color col;
  final String text;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Center(
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: col,
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
