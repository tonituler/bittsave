import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/myPlans.dart';
import 'package:six_cash/view/screens/home/savings_pages/savings_account.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';

class CreatAPlan extends StatefulWidget {
  const CreatAPlan({Key key}) : super(key: key);

  @override
  State<CreatAPlan> createState() => _CreatAPlanState();
}

class _CreatAPlanState extends State<CreatAPlan> {
  TextEditingController name = TextEditingController();

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
          Text(
            'Create a plan',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Give this plan a descriptive name. E.g My Shop, starting a Business. My Rent.',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 100),
          TextField(
            controller: name,
            decoration: InputDecoration(
              hintText: '     Name',
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
                    builder: (context) => SavingsAccount(
                      savingsInfo: {
                        "name": name.text,
                      }
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
