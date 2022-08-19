import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/savings_pages/myPlans1.dart';

import 'editingPlan.dart';

class Plan2 extends StatefulWidget {
  const Plan2({Key key}) : super(key: key);

  @override
  State<Plan2> createState() => _Plan2State();
}

class _Plan2State extends State<Plan2> {
  bool onOFF = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      floatingActionButton: FloatingActionButton(
        elevation: 12,
        onPressed: () {
          showModalBottomSheet(context: context, builder: modalBottomSheet);
        },
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/newImages/Plan1.png',
          scale: 4,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: [
                      BackButtons(),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            'Auto-Invest',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            height: 10,
                            child: CupertinoSwitch(
                                activeColor: Colors.pink,
                                value: onOFF,
                                onChanged: (value) {
                                  setState(() {
                                    onOFF = value;
                                  });
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('My School Fees',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20)),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditPlan()));
                        },
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.pink,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, bottom: 10, top: 5),
                    child: Text(
                      'Check how your savings is gaining',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  spaceCont('Plan Balance', '\$100.00', 'Periodic Deposit',
                      '\$10.00'),
                  spaceCont('Status', 'Active', 'Frequency', 'Weekly'),
                  spaceCont('Gains', '\$30.00', 'Total Earnings', '\$130.00'),
                  spaceCont('Plan Created on', '26 June 2022', 'Plan Ends on',
                      '26 October 2022'),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, top: 100),
                    child: Row(
                      children: [
                        RowCont('Add Money'),
                        Spacer(),
                        RowCont('Withdraw'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget modalBottomSheet(context) {
    return Container(
        color: Color(0xFF757575),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 18, top: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('Plan History', style: kLightStyle.copyWith(fontSize: 20)),
                SizedBox(height: 20),
                historyCont(),
                SizedBox(height: 10),
                historyCont(),
                SizedBox(height: 10),
                historyCont(),
                SizedBox(height: 10),
                historyCont(),
                SizedBox(height: 10),
                historyCont(),
              ],
            ),
          ),
        ));
  }

  Widget historyCont() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.pink,
            child: Text(
              'Deposit',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Container(
            color: Colors.pink[50],
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\$10.00', style: kBoldStyle),
                Spacer(),
                Center(
                    child: Text('9:29 PM | 21-June-2022', style: kLightStyle))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget RowCont(title) {
    return Container(
      width: 150,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.pink, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text('$title',
            style: kLightStyle.copyWith(color: Colors.white, fontSize: 14)),
      ),
    );
  }

  Widget spaceCont(t1, t2, t3, t4) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$t1', style: kLightStyle),
              Text('$t2',
                  style: kBoldStyle.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 15))
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('$t3', style: kLightStyle),
              Text('$t4',
                  style: kBoldStyle.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 15))
            ],
          ),
        ],
      ),
    );
  }
}
