import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/loan_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/base/custom_drop_down.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';
import 'package:six_cash/view/base/text_widgets.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/loan/history/loan_history.dart';
import 'package:six_cash/view/screens/home/loan/howToBeFunded.dart';

bool _show = false;
bool _showSummaryOfLoan = false;

class LoanApplication extends StatefulWidget {
  const LoanApplication({Key key}) : super(key: key);

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  TextEditingController amount = TextEditingController();
  String loanAmount;
  String planPeriod;
  String loanToValue;
  String repaymentOption;
  String repaymentOptionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackGroundColr(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                BackButtons(),
                BoldTextTitle(
                  data: 'Apply for a Loan',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Taking out a loan means you can put your plans into action much earlier',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Cont32(
                        onTap: () {
                          bottomLoanApkSheet();
                        },
                        title: 'Take a\nLoan',
                        subtitle: 'Borrow money\nto meet your\nneeds',
                        avatar: Image.asset(
                          'assets/newImages/Radar 02.png',
                          width: 60,
                        ),
                      ),
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Cont32(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoanHistory();
                          }));
                        },
                        title: 'Your Loan\nHistory',
                        subtitle: 'Monitor and know\nthe status of your\nloan today',
                        avatar: Image.asset(
                          'assets/newImages/Radar 01.png',
                          width: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Text(
                    'Try our loan calculator to get estimates and secure the best option for your needs and wants',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bottomLoanCalculationSheet();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.2, color: Colors.pink), color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Loan Calculator',
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _show == false ? Container() : AlertDialog(),
        _showSummaryOfLoan == false ? Container() : AlertDialog(),
      ],
    ));
  }

  Widget bottomLoanCalculationSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.h),
          topRight: Radius.circular(20.h),
        ),
      ),
      builder: (context) {
        return Container(
          height: 600.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              topRight: Radius.circular(20.h),
            ),
          ),
          child: SingleChildScrollView(
            child: GetBuilder<LoanController>(
              builder: (controller) {
                return GetBuilder<SplashController>(builder: (splashController) {
                  return StatefulBuilder(builder: (context, updateState) {
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.h),
                          topRight: Radius.circular(20.h),
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.48,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Loan Calculator',
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
                                  ),
                                  // Spacer(),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.pop(context);
                                  //   },
                                  //   child: CircleAvatar(
                                  //     backgroundColor: Colors.pink,
                                  //     radius: 14,
                                  //     child: Icon(
                                  //       Icons.clear,
                                  //       size: 20,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  regularText(
                                    "Loan amount",
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: ColorResources.greyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextFld(
                                    kTextField.copyWith(
                                      hintText: 'Loan Amount',
                                    ),
                                    controller: amount,
                                  ),
                                  CustomDropDownButton(
                                    title: 'Select a repayment period (Month)',
                                    hintText: 'Choose month',
                                    value: planPeriod,
                                    busy: false,
                                    onChanged: (a) {
                                      planPeriod = a;
                                      updateState(() {});
                                    },
                                    list: splashController.configModel.planPeriod.map((e) => e["period"].toString()).toList(),
                                  ),
                                  CustomDropDownButton(
                                    title: 'Select a loan to value',
                                    hintText: 'Choose a value',
                                    value: loanToValue,
                                    busy: false,
                                    onChanged: (a) {
                                      loanToValue = a;
                                      updateState(() {});
                                    },
                                    list: splashController.configModel.loanToValueOptions.map((e) => e["value"].toString()).toList(),
                                  ),
                                  CustomDropDownButton(
                                    title: 'Select a repayment type',
                                    hintText: 'Choose type',
                                    value: repaymentOption,
                                    busy: false,
                                    onChanged: (a) {
                                      repaymentOption = a;
                                      getRepaymentId(splashController.configModel.loanRepaymentOption, a);
                                      updateState(() {});
                                    },
                                    list: splashController.configModel.loanRepaymentOption.map((e) => e["name"].toString()).toList(),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: buttonWithBorder(
                                      'Calculate Loan',
                                      textColor: Colors.white,
                                      buttonColor: ColorResources.primaryColor,
                                      fontSize: 18.sp,
                                      busy: controller.isLoading,
                                      fontWeight: FontWeight.w400,
                                      height: 54.h,
                                      onTap: () async {
                                        if (amount.text.trim() == "" || planPeriod == null || repaymentOptionId == null || loanToValue == null) {
                                          showCustomSnackBar('Complete the loan form before submitting');
                                          return;
                                        }
                                        await controller.calculateLoan({
                                          "loan_amount": amount.text,
                                          "period": planPeriod,
                                          'repayment_option': repaymentOptionId,
                                          'loan_to_value': loanToValue,
                                        });

                                        if (controller.loanCalculationResult != null) {
                                          setState(() {
                                            _show = true;
                                          });
                                          Navigator.pop(context);
                                          setState(() {
                                            _show = true;
                                          });
                                          showLoanResult();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                });
              },
            ),
          ),
        );
      },
    );
  }

  getRepaymentId(List<Map<String, dynamic>> options, String value) {
    options.forEach((Map<String, dynamic> element) {
      if (element["name"] == value) {
        setState(() {
          repaymentOptionId = element["value"];
        });
      }
    });
  }

  Widget bottomLoanApkSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.h),
          topRight: Radius.circular(40.h),
        ),
      ),
      builder: (context) {
        return Container(
          height: 600.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.h),
              topRight: Radius.circular(40.h),
            ),
          ),
          child: SingleChildScrollView(
            child: GetBuilder<LoanController>(
              builder: (controller) {
                return GetBuilder<SplashController>(builder: (splashController) {
                  return StatefulBuilder(builder: (context, updateState) {
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.h),
                          topRight: Radius.circular(20.h),
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.48,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Loan Application',
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      radius: 14,
                                      child: Icon(
                                        Icons.clear,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  regularText(
                                    "Loan amount",
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: ColorResources.greyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextFld(
                                    kTextField.copyWith(
                                      hintText: 'Loan Amount',
                                    ),
                                    controller: amount,
                                  ),
                                  CustomDropDownButton(
                                    title: 'Select a repayment period (Month)',
                                    hintText: 'Choose month',
                                    value: planPeriod,
                                    busy: false,
                                    onChanged: (a) {
                                      planPeriod = a;
                                      updateState(() {});
                                    },
                                    list: splashController.configModel.planPeriod.map((e) => e["period"].toString()).toList(),
                                  ),
                                  CustomDropDownButton(
                                    title: 'Select a loan to value',
                                    hintText: 'Choose a value',
                                    value: loanToValue,
                                    busy: false,
                                    onChanged: (a) {
                                      loanToValue = a;
                                      updateState(() {});
                                    },
                                    list: splashController.configModel.loanToValueOptions.map((e) => e["value"].toString()).toList(),
                                  ),
                                  CustomDropDownButton(
                                    title: 'Select a repayment type',
                                    hintText: 'Choose a value',
                                    value: repaymentOption,
                                    busy: false,
                                    onChanged: (a) {
                                      repaymentOption = a;
                                      getRepaymentId(splashController.configModel.loanRepaymentOption, a);
                                      updateState(() {});
                                    },
                                    list: splashController.configModel.loanRepaymentOption.map((e) => e["name"].toString()).toList(),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: buttonWithBorder(
                                      'Continue',
                                      textColor: Colors.white,
                                      buttonColor: ColorResources.primaryColor,
                                      fontSize: 18.sp,
                                      busy: controller.isLoading,
                                      fontWeight: FontWeight.w400,
                                      height: 54.h,
                                      onTap: () async {
                                        if (amount.text.trim() == "" || planPeriod == null || repaymentOptionId == null || loanToValue == null) {
                                          showCustomSnackBar('Complete the loan form before submitting');
                                          return;
                                        }

                                        await controller.calculateLoan({
                                          "loan_amount": amount.text,
                                          "period": planPeriod,
                                          'repayment_option': repaymentOptionId,
                                          'loan_to_value': loanToValue,
                                        });

                                        if (controller.loanCalculationResult != null) {
                                          setState(() {
                                            _show = true;
                                          });
                                          Navigator.pop(context);
                                          setState(() {
                                            _show = true;
                                          });
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return HowToBeFunded(
                                                  loanInfo: {
                                                    "loan_amount": amount.text,
                                                    "period": planPeriod,
                                                    'repayment_option': repaymentOptionId,
                                                    'loan_to_value': loanToValue,
                                                  },
                                                  loanCalculation: controller.loanCalculationResult,
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget showLoanResult() {
    Widget widget = Container(
      color: Colors.transparent,
      child: GetBuilder<LoanController>(builder: (controller) {
        return Stack(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 350,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.black26, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BoldTextTitle(
                      data: 'Loan Calculator Result',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Summary from loan calculator',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 20),
                    subText('Total Payback'),
                    titleText('\$${controller.loanCalculationResult["total_payback"]}'),
                    SizedBox(height: 16),
                    subText('Loan Amount'),
                    titleText('\$${controller.loanCalculationResult["loan_amount"]}'),
                    SizedBox(height: 16),
                    subText('Monthly Payback'),
                    titleText('\$${controller.loanCalculationResult["monthly_payback"]}'),
                    SizedBox(height: 16),
                    subText('Collateral Volume'),
                    titleText('\$${controller.loanCalculationResult["collateral_volume"]} BTC'),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -2,
              right: -2,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _show = false;
                    });
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.clear, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );

    showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          height: 430,
          child: widget,
          color: Colors.transparent,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 0),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget titleText(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }

  Widget subText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        '$text',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  Widget TextFld(deco, {TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: deco,
        controller: controller,
      ),
    );
  }

  Widget SelectTxt(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  static const kTextField = InputDecoration(
    hintText: 'Choose a value',
    hintStyle: TextStyle(color: Colors.pink, fontWeight: FontWeight.w300, fontSize: 16),
  );
}

class Cont32 extends StatelessWidget {
  const Cont32({Key key, this.title, this.subtitle, this.avatar, this.onTap}) : super(key: key);
  final String title;
  final String subtitle;
  final Widget avatar;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 15),
        child: PhysicalModel(
          elevation: 5,
          color: Colors.white,
          shadowColor: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(width: 0.5, color: Colors.pink)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 14),
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 2),
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      avatar,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
