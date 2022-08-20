import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/savings_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/data/model/savings_plan.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/savings_pages/myPlans1.dart';

class SavingPlan extends StatefulWidget {
  SavingPlan({Key key, @required this.plan}) : super(key: key);
  SavingsPlan plan;

  @override
  State<SavingPlan> createState() => _Plan2State();
}

class _Plan2State extends State<SavingPlan> {
  bool onOFF = true;
  bool isPaying = false;
  bool isWithdrawing = false;
  bool isInitialLoad = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavingsController>(builder: (savingsController) {
      return BackGroundColr(
        child: GetBuilder<SavingsController>(
          builder: (controller) {
            return FutureBuilder(
              future: loadSavings(controller),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  isInitialLoad = true;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  isInitialLoad = true;
                  return notSavingsItem();
                } else if (snapshot.hasData) {
                  isInitialLoad = true;
                  onOFF = (controller.planDetails["auto_invest"] == 1) ? true: false;

                  if (controller.savingsList.isEmpty) {
                    return notSavingsItem();
                  } else {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      floatingActionButton: FloatingActionButton(
                        elevation: 12,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return modalBottomSheet(controller);
                            },
                          );
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
                                                  savingsController.updateSavings({
                                                    "id": widget.plan.id,
                                                    "auto_invest": (onOFF) ? 1 : 0
                                                  });
                                                }),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(widget.plan.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, bottom: 10, top: 5),
                                    child: Text(
                                      'Check how your savings is gaining',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  spaceCont(
                                    'Plan Balance',
                                    '\$${controller.planDetails["plan_balance"]}',
                                    'Periodic Deposit',
                                    '\$${controller.planDetails["invested"]}',
                                  ),
                                  spaceCont(
                                    'Status',
                                    controller.planDetails["status"].toString().capitalizeFirst,
                                    'Frequency',
                                    getFrequency(controller.planDetails["status"].toString()),
                                  ),
                                  spaceCont(
                                    'Gains',
                                    '\$${controller.planDetails["gains"]}',
                                    'Total Earnings',
                                    '\$${controller.planDetails["total_earning"]}',
                                  ),
                                  spaceCont(
                                    'Plan Created on',
                                    formatedDate(controller.planDetails["start_date"]),
                                    'Plan Ends on',
                                    formatedDate(controller.planDetails["end_date"]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10, top: 100),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width * .4,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            vertical: 35.w,
                                          ),
                                          child: buttonWithBorder(
                                            'Add Money',
                                            textColor: Colors.white,
                                            buttonColor: ColorResources.primaryColor,
                                            fontSize: 18.sp,
                                            busy: isPaying,
                                            diabled: isWithdrawing,
                                            fontWeight: FontWeight.w400,
                                            height: 54.h,
                                            onTap: () async {
                                              setState(() {
                                                isPaying = true;
                                              });
                                              bool response = await savingsController.planPay(widget.plan.id.toString());

                                              setState(() {
                                                isPaying = false;
                                              });
                                            },
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width * .4,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            vertical: 35.w,
                                          ),
                                          child: buttonWithBorder(
                                            'Withdraw',
                                            textColor: Colors.white,
                                            buttonColor: ColorResources.primaryColor,
                                            fontSize: 18.sp,
                                            busy: isWithdrawing,
                                            diabled: isPaying,
                                            fontWeight: FontWeight.w400,
                                            height: 54.h,
                                            onTap: () async {
                                              setState(() {
                                                isWithdrawing = true;
                                              });
                                              bool response = await savingsController.withdrawPlan(widget.plan.id.toString());

                                              setState(() {
                                                isWithdrawing = false;
                                              });
                                            },
                                          ),
                                        ),
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
                } else {
                  isInitialLoad = true;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
        ),
      );
    });
  }

  String getFrequency(String frequencyId) {
    String _frequency = "Weekly";
    List<Map<String, dynamic>> freq = Get.find<SplashController>().configModel.planFrequency;
    freq.forEach((element) {
      if (frequencyId == element["value"].toString()) {
        _frequency = element["name"];
      }
    });
    return _frequency;
  }

  Future<bool> loadSavings(SavingsController controller) async {
    if (isInitialLoad == true) {
      return false;
    }

    return await controller.checkPlan(widget.plan.id.toString());
  }

  String formatedHistoryDate(String date) {
    DateTime dT = DateTime.parse(date);

    return DateFormat('hh:mm a').format(DateTime(0, dT.month, dT.day, dT.hour, dT.minute)) +
        " | " "${dT.day}-" +
        DateFormat('MMMM').format(DateTime(0, dT.month)) +
        "-" +
        dT.year.toString();
  }

  String formatedDate(String date) {
    DateTime dT = DateTime.parse(date);

    return "${dT.day} " + DateFormat('MMMM').format(DateTime(0, dT.month)) + " " + dT.year.toString();
  }

  Widget notSavingsItem() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: BackButtons(),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Center(
              child: Image.asset(
                'assets/newImages/Take a Loan.png',
                scale: 0.7,
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Record not available',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 7),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget modalBottomSheet(SavingsController controller) {
    List<Widget> items = [];

    List<Map<String, dynamic>>.from(controller.planDetails["listed_plan"]).forEach((item) {
      items.add(historyCont(item));
    });

    return Container(
        color: Color(0xFF757575),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 18, top: 20, right: 20),
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('Plan History', style: kLightStyle.copyWith(fontSize: 20)),
                SizedBox(height: 10),
                ...items,
              ],
            ),
          ),
        ));
  }

  Widget historyCont(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.pink,
            child: Text(
              (item["credit"].toString() == "0") ? 'Deposit' : "Withdrawal",
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
                Text('\$${(item["debit"].toString() == "0") ? item["credit"] : item["debit"]}', style: kBoldStyle),
                Spacer(),
                Center(
                  child: Text(
                    formatedHistoryDate(item["payment_date"]),
                    style: kLightStyle,
                  ),
                ),
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
      decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text('$title', style: kLightStyle.copyWith(color: Colors.white, fontSize: 14)),
      ),
    );
  }

  Widget spaceCont(t1, t2, t3, t4) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('$t1', style: kLightStyle), Text('$t2', style: kBoldStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15))],
            ),
          ),
          // Spacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('$t3', style: kLightStyle), Text('$t4', style: kBoldStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15))],
            ),
          ),
        ],
      ),
    );
  }
}

const kLightStyle = TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 10);

const kBoldStyle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
