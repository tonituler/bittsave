import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/set_lock_period.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SavingsAccount extends StatefulWidget {
  const SavingsAccount({Key key}) : super(key: key);

  @override
  State<SavingsAccount> createState() => _SavingsAccountState();
}

class _SavingsAccountState extends State<SavingsAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              Text('Savings Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22)),
              SizedBox(height: 8),
              Text('Set an amount that you would be saving .',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              SizedBox(height: 100),
              TextField(
                decoration: InputDecoration(
                    hintText: '     Amount',
                    hintStyle: TextStyle(color: Colors.pink, fontSize: 15)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: newContTap(
                  col: Colors.pink,
                  text: 'Next',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetLockPeriod()));
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
