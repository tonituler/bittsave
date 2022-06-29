import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/friend_identity.dart';

import '../../wallet_tabs/funding_usd_wallet_page.dart';

class ActiveLoans extends StatefulWidget {
  const ActiveLoans({Key key}) : super(key: key);

  @override
  State<ActiveLoans> createState() => _ActiveLoansState();
}

class _ActiveLoansState extends State<ActiveLoans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: [
                      BackButtons(),
                      Spacer(),
                      Container(
                          width: 50,
                          height: 50,
                          child:
                              Image.asset('assets/newImages/Plus in a box.png'))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      valueCont('active'),
                      SizedBox(height: 15),
                      valueCont('overdue'),
                      SizedBox(height: 15),
                      valueCont('completed'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget valueCont(String text) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 25,
            child: Center(
                child: Text(
              '$text',
              style: TextStyle(color: Colors.white),
            )),
            color: Colors.pink,
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Loan Amount',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          '\$200.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Payback',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          '\$205.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Due date:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 4),
                    Center(
                      child: Text(
                        '9:29 PM | 21-June-2022',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'Pay Now',
                        style: TextStyle(color: Colors.white),
                      )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const kTextField = InputDecoration(
      hintText: 'Choose a value',
      hintStyle: TextStyle(
          color: Colors.pink, fontWeight: FontWeight.w300, fontSize: 16));
}
