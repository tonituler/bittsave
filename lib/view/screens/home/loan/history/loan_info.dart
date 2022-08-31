import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/loan_controller.dart';
import 'package:six_cash/data/model/loan_model.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';

class LoanInfo extends StatefulWidget {
  LoanInfo({Key key, @required this.loanInfo}) : super(key: key);
  Loan loanInfo;

  @override
  State<LoanInfo> createState() => _LoanInfoState();
}

class _LoanInfoState extends State<LoanInfo> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   leading: BackButtons(),
        //   backgroundColor: Colors.white.withOpacity(0),
        //   elevation: 0,
        // ),
        body: GetBuilder<LoanController>(builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      BackButtons(),
                      BoldTextTitle(
                        data:
                            '${widget.loanInfo.loanAmount} - N${PriceConverter.convertToNaira(double.parse(widget.loanInfo.loanAmount.toString()))}',
                      ),
                      SizedBox(height: 20),
                      subText('Total Payback'),
                      titleText('\$${widget.loanInfo.totalRepayment}'),
                      SizedBox(height: 16),
                      subText('Loan Amount'),
                      titleText('\$${widget.loanInfo.loanAmount}'),
                      SizedBox(height: 16),
                      subText('Next Payment'),
                      titleText('\$${widget.loanInfo.nextPayment}'),
                      SizedBox(height: 16),
                      subText('Current Balance'),
                      titleText('\$${widget.loanInfo.currentBalance}'),
                      SizedBox(height: 16),
                      subText('Status'),
                      titleText('${widget.loanInfo.status}'),
                      SizedBox(height: 16),
                      subText('Due Date'),
                      titleText('${widget.loanInfo.dueDate}'),
                      SizedBox(height: 16),
                      subText('Collateral Volume'),
                      titleText(
                          '${PriceConverter.converDolarToBTC(double.parse(widget.loanInfo.collateral))} BTC'),
                      SizedBox(height: 50),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: buttonWithBorder(
                          'Pay Now',
                          textColor: Colors.white,
                          buttonColor: ColorResources.primaryColor,
                          fontSize: 18.sp,
                          busy: controller.isLoading,
                          fontWeight: FontWeight.w400,
                          height: 54.h,
                          onTap: () async {
                            bool response = await controller.payLoan(
                                loanId: widget.loanInfo.id.toString());

                            if (response == true) {
                              Get.offAllNamed(RouteHelper.getNavBarRoute(),
                                  arguments: true);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
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
      color: Colors.pink,
      fontWeight: FontWeight.w300,
      fontSize: 16,
    ),
  );

  Widget titleText(text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: ColorResources.primaryColor.withOpacity(0.5)))),
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
        style: TextStyle(fontSize: 12, color: Colors.pink),
      ),
    );
  }
}
