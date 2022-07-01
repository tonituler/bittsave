import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/Successfull_page.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class PlanSummary extends StatefulWidget {
  const PlanSummary({Key key}) : super(key: key);

  @override
  State<PlanSummary> createState() => _PlanSummaryState();
}

class _PlanSummaryState extends State<PlanSummary> {
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
              Text('Plan Summary',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22)),
              SizedBox(height: 8),
              Text(
                  'Lets go over all you\'ve selected, then you proceed to stacking Bitcoin!',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              Container(
                margin: EdgeInsets.only(top: 60, right: 10, left: 10),
                padding: EdgeInsets.only(left: 40, right: 40, top: 25),
                height: 360,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.pink, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    conColumn('Type of Plan', 'Target Amount',
                        'Bitcoin Savings', '\$400.00'),
                    conColumn('Plan Name', 'Periodic Amount', 'School Fees',
                        '\$20.00'),
                    conColumn(
                        'Lock Period', 'Frequency', '3 Months', 'Once a week'),
                    conColumn('ROI', 'Start On', '\$420.00', '6th June, 2022'),
                    conColumn('Payment Method', 'Cashout Method', 'USD Wallet',
                        'USD Wallet'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                child: newContTap(
                  col: Colors.pink,
                  text: 'Next',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessfullPage()));
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget conColumn(String sub1, String sub2, String title1, String title2) {
    return Column(
      children: [
        Row(children: [
          Text(
            sub1,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Spacer(),
          Text(sub2, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ]),
        SizedBox(height: 2),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title1,
            style: TextStyle(
                color: Colors.black,
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              title2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ]),
        Divider(
          height: 30,
          thickness: 1,
          color: Colors.pink,
        ),
      ],
    );
  }
}
