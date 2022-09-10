import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:six_cash/controller/savings_controller.dart';
import 'package:six_cash/data/model/savings_plan.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/savings_pages/plan2.dart';
import 'package:six_cash/view/screens/home/savings_pages/start_saving_page.dart';

import '../../../../util/dimensions.dart';
import '../funding_usd_wallet_page.dart';

class MyPlans extends StatefulWidget {
  MyPlans({Key key, this.shouldNavigate = true}) : super(key: key);
  bool shouldNavigate;

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  bool isInitialLoad = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

                if (controller.savingsList.isEmpty) {
                  return notSavingsItem();
                } else {
                  return Scaffold(
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartSavingPage(),
                          ),
                        );
                      },
                      backgroundColor: ColorResources.primaryColor,
                      child: Image.asset(
                        'assets/image/plus23.png',
                        scale: 3,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    // appBar: AppBar(
                    //   leading: (widget.shouldNavigate)
                    //       ? Padding(
                    //           padding: const EdgeInsets.only(top: 10.0),
                    //           child: BackButtons(),
                    //         )
                    //       : SizedBox(),
                    //   backgroundColor: Colors.white.withOpacity(0),
                    //   elevation: 0,
                    // ),
                    body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          if(widget.shouldNavigate)
                          BackButtons(),
                          Text(
                            'My Plans',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                          Text('Check how your savings is gaining',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15)),
                          SizedBox(height: 40),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: controller.savingsList
                                    .map((item) => savingItem(item))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
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
  }

  Widget savingItem(SavingsPlan plan) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 22,
            decoration: BoxDecoration(
                color: (plan.status?.toLowerCase() == "completed")
                    ? Colors.green
                    : Colors.pink,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                '${plan.status}',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavingPlan(
                    plan: plan,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              // height: 100,

              color: Colors.white.withOpacity(0.3),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plan name',
                            style: TextStyle(
                                color: ColorResources.COLOR_PRIMARY,
                                fontSize: 10),
                          ),
                          Text(
                            plan.name,
                            // '\$${PriceConverter.priceFormater(balance: double.parse(loan.loanAmount))}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gains',
                            style: TextStyle(
                                color: ColorResources.COLOR_PRIMARY,
                                fontSize: 10),
                          ),
                          Text(
                            '\$${PriceConverter.priceFormater(balance: double.parse(plan.gains))}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Target amount',
                            style: TextStyle(
                                color: ColorResources.COLOR_PRIMARY,
                                fontSize: 10),
                          ),
                          Text(
                            '\$${PriceConverter.priceFormater(balance: double.parse(plan.targetAmount))}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Next payment:',
                        style: TextStyle(
                            color: ColorResources.COLOR_PRIMARY,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 4),
                      Center(
                        child: Text(
                          formatedDate(plan.nextPaymentDate),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatedDate(String date) {
    DateTime dT = DateTime.parse(date);

    return DateFormat('hh:mm a')
            .format(DateTime(0, dT.month, dT.day, dT.hour, dT.minute)) +
        " | " "${dT.day}-" +
        DateFormat('MMMM').format(DateTime(0, dT.month)) +
        "-" +
        dT.year.toString();
  }

  Widget notSavingsItem() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: (widget.shouldNavigate)
            ? Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BackButtons(),
              )
            : SizedBox(),
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
            SizedBox(
              height: 10,
            ),
            Text(
              'My Plans',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            Text('Check how your savings is gaining',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 15)),
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
                'No active plans',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 7),
            Center(
              child: Text(
                'You\'ve not created a plan, but thats about to change. Just tap the button below',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),
            newContTap(
              col: Colors.pink,
              text: 'Create a plan',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartSavingPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> loadSavings(SavingsController controller) async {
    if (isInitialLoad == true) {
      return false;
    }

    return controller.getSavingsList();
  }
}

class newContTap extends StatelessWidget {
  const newContTap({
    this.col,
    this.text,
    this.ontap,
    Key key,
  }) : super(key: key);

  final Color col;
  final String text;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Center(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: col,
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
