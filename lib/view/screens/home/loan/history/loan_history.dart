import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/loan_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/data/model/loan_model.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/base/custom_drop_down.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';
import 'package:six_cash/view/base/text_widgets.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/loan/history/loan_info.dart';
import 'package:six_cash/view/screens/home/loan/howToBeFunded.dart';

import '../../../../../util/dimensions.dart';

bool _showBtSheet = false;
const kTextField = InputDecoration(
  hintText: 'Choose a value',
  hintStyle:
      TextStyle(color: Colors.pink, fontWeight: FontWeight.w300, fontSize: 16),
);

class LoanHistory extends StatefulWidget {
  const LoanHistory({Key key}) : super(key: key);

  @override
  State<LoanHistory> createState() => _LoanHistoryState();
}

class _LoanHistoryState extends State<LoanHistory> {
  bool isInitialLoad = false;
  TextEditingController amount = TextEditingController();
  String loanAmount;
  String planPeriod;
  String loanToValue;
  String repaymentOption;
  String repaymentOptionId;
  bool _show = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.1),
        // appBar: AppBar(
        //   leading: Padding(
        //     padding: const EdgeInsets.only(top: 20.0),
        //     child: BackButtons(),
        //   ),
        //   backgroundColor: Colors.white.withOpacity(0),
        //   elevation: 0,
        // ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: BackButtons(),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GetBuilder<SplashController>(
                      builder: (splashController) {
                        return GetBuilder<LoanController>(
                          builder: (controller) {
                            return FutureBuilder(
                              future: loadLoans(controller),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  isInitialLoad = true;
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  isInitialLoad = true;
                                  return noLoanItem();
                                } else if (snapshot.hasData) {
                                  isInitialLoad = true;

                                  if (controller.loansHistory.isEmpty) {
                                    return noLoanItem();
                                  } else {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: controller.loansHistory
                                            .map((item) => loanItem(item))
                                            .toList(),
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
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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

  Widget noLoanItem() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 27.0, bottom: 18),
            child: Center(
                child: Image.asset(
              'assets/newImages/Take a Loan.png',
              width: 130,
              scale: 0.5,
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Center(
              child: Text(
                'No active loans',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Text(
                'You have not applied for a loan, but thats about to change. Tap the button below',
                textAlign: TextAlign.center),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: buttonWithBorder(
              'Apply for Loan',
              textColor: Colors.white,
              buttonColor: ColorResources.primaryColor,
              fontSize: 18.sp,
              busy: false,
              fontWeight: FontWeight.w400,
              height: 54.h,
              onTap: () {
                bottomLoanApkSheet();
              },
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Try our loan calculator to get estimates and secure the best option for your needs and wants',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: buttonWithBorder(
              'Loan Calculator',
              textColor: ColorResources.primaryColor,
              buttonColor: ColorResources.whiteColor,
              borderColor: ColorResources.primaryColor,
              fontSize: 18.sp,
              busy: false,
              fontWeight: FontWeight.w400,
              height: 54.h,
              onTap: () {
                bottomLoanCalculationSheet();
              },
            ),
          ),
        ],
      ),
    );
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

  Widget bottomLoanApkSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // isDismissible: false,
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

  
  Widget loanItem(Loan loan) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 22,
            decoration: BoxDecoration(
                color: (loan.status?.toLowerCase() == "completed")
                    ? Colors.green
                    : Colors.pink,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                '${loan.status}',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            // height: 110,
            color: Colors.white.withOpacity(0.3),
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
                          style: TextStyle(color: Colors.pink, fontSize: 10),
                        ),
                        Text(
                          '\$${PriceConverter.priceFormater(balance: double.parse(loan.loanAmount))}',
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
                          'Total Payback',
                          style: TextStyle(color: Colors.pink, fontSize: 10),
                        ),
                        Text(
                          '\$${PriceConverter.priceFormater(balance: double.parse(loan.totalRepayment))}',
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
                      'Due date:',
                      style: TextStyle(
                          color: ColorResources.COLOR_PRIMARY,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 4),
                    Center(
                      child: Text(
                        '9:29 PM | 21-June-2022',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                    Spacer(),
                    if (loan.status?.toLowerCase() != "completed")
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoanInfo(
                                  loanInfo: loan,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 20,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Pay Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
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

  getRepaymentId(List<Map<String, dynamic>> options, String value) {
    options.forEach((Map<String, dynamic> element) {
      if (element["name"] == value) {
        setState(() {
          repaymentOptionId = element["value"];
        });
      }
    });
  }

  Widget AlertPage() {
    return Container(
      color: Colors.white70,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(color: Colors.black26, width: 0.2),
                    borderRadius: BorderRadius.circular(20)),
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
                    titleText('\$301.00'),
                    SizedBox(height: 16),
                    subText('Loan Amount'),
                    titleText('\$250.00'),
                    SizedBox(height: 16),
                    subText('Monthly Payback'),
                    titleText('\$300.00'),
                    SizedBox(height: 16),
                    subText('Collateral Volume'),
                    titleText('\$0.93939399 BTC.00'),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: InnerContainer(
                          col: Colors.pink,
                          widget: Text(
                            'Close',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 160,
              right: 20,
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.clear, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> loadLoans(LoanController controller) async {
    if (isInitialLoad == true) {
      return false;
    }

    return controller.listLoan();
  }
}
