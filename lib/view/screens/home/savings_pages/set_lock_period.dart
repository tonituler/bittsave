import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/set_frequency.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SetLockPeriod extends StatefulWidget {
  const SetLockPeriod({Key key}) : super(key: key);

  @override
  State<SetLockPeriod> createState() => _SetLockPeriodState();
}

class _SetLockPeriodState extends State<SetLockPeriod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              Text('Set a lock period',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22)),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                    'How long would you like to save to achieve this plan',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
              ),
              SizedBox(height: 80),
              RowCont(text: '3 Months', col: Colors.pink),
              RowCont(col: Colors.white, text: '6 Months'),
              RowCont(col: Colors.white, text: '12 Months'),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 60),
                child: Text('Duration: 3 Months\nInterest Rate : 55% PA',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: newContTap(
                  col: Colors.pink,
                  text: 'Next',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetFrequency()));
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class RowCont extends StatelessWidget {
  final String text;
  final Color col;
  const RowCont({Key key, this.col, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              '3 Months',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(width: 100),
          Center(
            child: CircleAvatar(
              radius: 10,
              child: Icon(Icons.check, color: col, size: 13),
              backgroundColor: Colors.pink[100],
            ),
          ),
        ],
      ),
    );
  }
}
