import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';
import 'package:bittsave/view/screens/home/savings_pages/set_lock_period.dart';

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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              BackButtons(),
              Text(
                'Savings Account',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 8),
              Text('Set an amount that you would be saving .', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
              SizedBox(height: 100),
              TextField(
                controller: amount,
                keyboardType: TextInputType.phone,
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
                    if (amount.text.trim().isEmpty) {
                      showCustomSnackBar("Amount cannot be empty", isIcon: true);
                      return;
                    }
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
