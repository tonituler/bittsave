import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/set_lock_period.dart';
import 'package:six_cash/view/screens/home/savings_pages/set_start_date.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SetFrequency extends StatefulWidget {
  const SetFrequency({Key key}) : super(key: key);

  @override
  State<SetFrequency> createState() => _SetFrequencyState();
}

class _SetFrequencyState extends State<SetFrequency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BackGroundColr(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtons(),
                Text('Set your frequency',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22)),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('How often would you like to safe for this plan?',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15)),
                ),
                SizedBox(height: 80),
                RowCont(text: 'Every day', col: Colors.pink),
                RowCont(col: Colors.white, text: 'Once a week'),
                RowCont(col: Colors.white, text: 'Once a month'),
                SizedBox(height: 110),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: newContTap(
                    col: Colors.pink,
                    text: 'Next',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SetStartDate()));
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
