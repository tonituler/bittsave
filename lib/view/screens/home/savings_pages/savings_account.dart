import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/set_lock_period.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SavingsAccount extends StatefulWidget {
  SavingsAccount({Key key, @required this.savingsInfo}) : super(key: key);
  Map<String, dynamic> savingsInfo;

  @override
  State<SavingsAccount> createState() => _SavingsAccountState();
}

class _SavingsAccountState extends State<SavingsAccount> {
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: BackButtons(),
          backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Savings Account', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
              SizedBox(height: 8),
              Text('Set an amount that you would be saving .', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
              SizedBox(height: 100),
              TextField(
                controller: amount,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  hintStyle: TextStyle(
                    color: Colors.pink,
                    fontSize: 15,
                  ),
                ),
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
                        builder: (context) => SetLockPeriod(
                          savingsInfo: {
                            ...widget.savingsInfo,
                            "amount": amount.text,
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
