import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/savings_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/data/model/savings_plan.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/savings_pages/editingPlan.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/expandable_contant.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/persistent_header.dart';

import '../../../../util/dimensions.dart';

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
  final TextEditingController _pinCodeFieldController = TextEditingController();

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
                  onOFF = (controller.planDetails.autoInvest == 1) ? true : false;

                  if (controller.planDetails == null) {
                    return notSavingsItem();
                  } else {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Container(
                        height: MediaQuery.of(context).size.height,
                        child: ExpandableBottomSheet(
                          enableToggle: true,
                          persistentContentHeight: 150,
                          background: SingleChildScrollView(
                            child: SafeArea(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
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
                                                      savingsController.updateSavings({"id": widget.plan.id, "auto_invest": (onOFF) ? 1 : 0});
                                                    }),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
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
                                              ],
                                            ),
                                            Spacer(),
                                            if (controller.planDetails.status.toString() != "completed")
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => EditPlan(savingsPlan: controller.planDetails)));
                                                },
                                                icon: Icon(
                                                  Icons.edit_outlined,
                                                  color: Colors.pink,
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                      spaceCont(
                                        'Plan Balance',
                                        '\$${controller.planDetails.curentBalance}',
                                        'Periodic Deposit',
                                        '\$${controller.planDetails.invested}',
                                        Colors.transparent,
                                      ),
                                      spaceCont(
                                        'Status',
                                        controller.planDetails.status.toString().capitalizeFirst,
                                        'Frequency',
                                        getFrequency(controller.planDetails.status.toString()),
                                        Colors.white.withOpacity(0.3),
                                      ),
                                      spaceCont(
                                        'Gains',
                                        '\$${controller.planDetails.gains}',
                                        'Total Earnings',
                                        '\$${controller.planDetails.totalEarning}',
                                        Colors.transparent,
                                      ),
                                      spaceCont(
                                        'Plan Created on',
                                        formatedDate(controller.planDetails.startDate),
                                        'Plan Ends on',
                                        formatedDate(controller.planDetails.endDate),
                                        Colors.white.withOpacity(0.5),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 0),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width * .4,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 0.w,
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
                                                diabled: false,
                                                fontWeight: FontWeight.w400,
                                                height: 54.h,
                                                onTap: () async {
                                                  showPinBottomSheet("pay", widget.plan.id);
                                                },
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width * .4,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 0.w,
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
                                                diabled: false,
                                                fontWeight: FontWeight.w400,
                                                height: 54.h,
                                                onTap: () async {
                                                  showPinBottomSheet("withdraw", widget.plan.id);
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
                          persistentHeader: CustomPersistentHeader(),
                          expandableContent: CustomExpandableContant(),
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

  showPinBottomSheet(String slug, int id) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context,
        isDismissible: true,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.RADIUS_SIZE_LARGE),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, updateState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                        child: Text(
                          'Enter your transaction PIN',
                          style: montserratMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(27.0), color: ColorResources.getGreyBaseGray6()),
                        child: TextField(
                          controller: _pinCodeFieldController,
                          obscureText: true,
                          maxLength: 4,
                          textAlign: TextAlign.center,
                          // hintCharacter: '•',
                          onChanged: (value) {
                            updateState(() {});
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                          decoration: InputDecoration(
                            hintText: 'PIN',
                            hintStyle: TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                            ),
                            contentPadding: const EdgeInsets.all(0),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      GetBuilder<SavingsController>(builder: (savingsController) {
                        return Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 35.w,
                          ),
                          child: buttonWithBorder(
                            'Submit',
                            textColor: Colors.white,
                            buttonColor: ColorResources.primaryColor,
                            fontSize: 18.sp,
                            busy: isWithdrawing,
                            fontWeight: FontWeight.w400,
                            height: 54.h,
                            onTap: () async {
                              isWithdrawing = true;
                              updateState(() {});
                              if (slug == "pay") {
                                await savingsController.planPay(context, id.toString(), _pinCodeFieldController.text);
                              }
                              if (slug == "withdraw") {
                                await savingsController.withdrawPlan(context, id.toString(), _pinCodeFieldController.text);
                              }
                              _pinCodeFieldController.text = "";
                              isWithdrawing = false;
                              updateState(() {});
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          });
        });
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

    List<Map<String, dynamic>>.from(controller.planDetails.listedPlan).forEach((item) {
      items.add(historyCont(item));
    });

    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      color: Colors.white,
      // width: 400,
      // height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text('Plan History', style: kLightStyle.copyWith(fontSize: 20, color: ColorResources.primaryColor)),
          SizedBox(height: 10),
          // ...items,
        ],
      ),
    );
  }

  Widget historyCont(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.pink,
            child: Text(
              (item["credit"].toString() == "0") ? 'Deposit' : "Withdrawal",
              style: kLightStyle.copyWith(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.pink.withOpacity(0.05),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\$${(item["debit"].toString() == "0") ? item["credit"] : item["debit"]}',
                    style: kBoldStyle.copyWith(color: Colors.black, fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                Spacer(),
                Center(
                  child: Text(
                    formatedHistoryDate(item["payment_date"]),
                    style: kLightStyle.copyWith(color: Colors.black, fontWeight: FontWeight.w300),
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

  Widget spaceCont(t1, t2, t3, t4, whiteCol) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 12),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 20, top: 20),
        color: whiteCol,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$t1', style: kLightStyle.copyWith(color: ColorResources.primaryColor)),
                  Text('$t2', style: kBoldStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15))
                ],
              ),
            ),
            // Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('$t3', style: kLightStyle.copyWith(color: ColorResources.primaryColor)),
                  Text('$t4',
                      style: kBoldStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const kLightStyle = TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 10);

const kBoldStyle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
