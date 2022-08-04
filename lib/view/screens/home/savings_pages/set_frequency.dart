import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/screens/home/savings_pages/set_lock_period.dart';
import 'package:six_cash/view/screens/home/savings_pages/set_start_date.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SetFrequency extends StatefulWidget {
  SetFrequency({Key key, @required this.savingsInfo}) : super(key: key);
  Map<String, dynamic> savingsInfo;

  @override
  State<SetFrequency> createState() => _SetFrequencyState();
}

class _SetFrequencyState extends State<SetFrequency> {
  String selectedFrequency = "1";
  String frequencyName = "Everyday";

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
        body: GetBuilder<SplashController>(builder: (splashController) {
          print(splashController.configModel.planFrequency);
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Set your frequency', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text('How often would you like to safe for this plan?',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                  SizedBox(height: 80),
                  ...splashController.configModel.planFrequency.map((Map<String, dynamic> item) => monthItem(frequency: item)).toList(),
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
                            builder: (context) => SetStartDate(
                              savingsInfo: {
                                ...widget.savingsInfo,
                                "frequency": selectedFrequency,
                                "frequency_name": frequencyName,
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
          );
        }),
      ),
    );
  }

  Widget monthItem({Map<String, dynamic> frequency}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFrequency = frequency["value"];
          frequencyName = frequency["name"];
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 10, right: 150.w, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${frequency["name"]}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Spacer(),
            Center(
              child: CircleAvatar(
                radius: 10,
                child: Icon(Icons.check, color: (frequency["name"] == frequencyName) ? ColorResources.primaryColor : Colors.white, size: 13),
                backgroundColor: Colors.pink[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
