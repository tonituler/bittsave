import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/screens/home/savings_pages/set_frequency.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SetLockPeriod extends StatefulWidget {
  SetLockPeriod({Key key, @required this.savingsInfo}) : super(key: key);
  Map<String, dynamic> savingsInfo;

  @override
  State<SetLockPeriod> createState() => _SetLockPeriodState();
}

class _SetLockPeriodState extends State<SetLockPeriod> {
  String selectedMonth = "1";
  String selectedMonthName = "3";
  String interestRate = "0";

  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<SplashController>(builder: (splashController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                BackButtons(),
                Text(
                  'Set a lock period',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'How long would you like to save to achieve this plan',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 80),
                ...splashController.configModel.planPeriod.map((Map<String, dynamic> item) => monthItem(month: item)).toList(),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 60),
                  child: Text(
                    'Duration: $selectedMonthName Months\nInterest Rate : ${getInterestRate(selectedMonthName, splashController)}% PA',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
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
                          builder: (context) => SetFrequency(
                            savingsInfo: {
                              ...widget.savingsInfo,
                              "period": selectedMonth,
                              "lock_period": selectedMonthName + " Months",
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  String getInterestRate(String month, SplashController splashController) {
    String interestRate = "0";
    splashController.configModel.planPeriod.forEach((Map<String, dynamic> element) {
      if (element["period"].toString() == month) {
        interestRate = element["interest"].toString();
      }
    });

    double value = double.parse(interestRate) * 100;
    if (value == 0) {
      return "0";
    }

    return value.toInt().toString();
  }

  Widget monthItem({Map<String, dynamic> month}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMonth = month["id"].toString();
          selectedMonthName = month["period"].toString();
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 10, right: 150.w, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${month["period"]} Months',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Spacer(),
            Center(
              child: CircleAvatar(
                radius: 10,
                child: Icon(Icons.check, color: (month["id"].toString() == selectedMonth) ? ColorResources.primaryColor : Colors.white, size: 13),
                backgroundColor: Colors.pink[100],
              ),
            ),
          ],
        ),
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
