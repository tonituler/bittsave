import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/savings_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/screens/home/savings_pages/Successfull_page.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';

class PlanSummary extends StatefulWidget {
  PlanSummary({Key key, @required this.savingsInfo, @required this.planPreview}) : super(key: key);
  Map<String, dynamic> savingsInfo;
  Map<String, dynamic> planPreview;

  @override
  State<PlanSummary> createState() => _PlanSummaryState();
}

class _PlanSummaryState extends State<PlanSummary> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<SavingsController>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  BackButtons(),
                  Text('Plan Summary', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
                  SizedBox(height: 8),
                  Text('Lets go over all you\'ve selected, then you proceed to stacking Bitcoin!',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
                  Container(
                    margin: EdgeInsets.only(top: 60, right: 10, left: 10),
                    padding: EdgeInsets.only(left: 10, right: 10, top: 25),
                    height: 360,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white54, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.pink, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        conColumn('Type of Plan', 'Target Amount', "Bitcoin saving",
                            '\$${PriceConverter.priceFormater(balance: double.parse(widget.planPreview["target_amount"].toString()))}', Colors.pink),
                        conColumn('Plan Name', 'Periodic Amount', widget.savingsInfo["name"],
                            '\$${PriceConverter.priceFormater(balance: double.parse(widget.planPreview["amount"].toString()))}', Colors.pink),
                        conColumn('Lock Period', 'Frequency', widget.savingsInfo["lock_period"].toString(),
                            widget.savingsInfo["frequency_name"].toString(), Colors.pink),
                        conColumn('ROI', 'Start On', '\$${PriceConverter.priceFormater(balance: double.parse(widget.planPreview["roi"].toString()))}',
                            formatedDate(), Colors.pink),
                        // conColumn('ROI', 'Start On', '\$${PriceConverter.priceFormater(balance: double.parse(widget.planPreview["roi"].toString()))}', DateFormat("MMMM dd, yyyy").parse(widget.savingsInfo["start_date"].toString()).toString()),
                        conColumn('Payment Method', 'Cashout Method', widget.savingsInfo["debit_type_name"].toString(),
                            widget.savingsInfo["credit_type_name"].toString(), Colors.white),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 35.w,
                    ),
                    child: buttonWithBorder(
                      'Save plan',
                      textColor: Colors.white,
                      buttonColor: ColorResources.primaryColor,
                      fontSize: 18.sp,
                      busy: controller.isLoading,
                      fontWeight: FontWeight.w400,
                      height: 54.h,
                      onTap: () async {
                        bool response = await controller.planApply({
                          ...widget.savingsInfo,
                        });

                        if (response) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessfullPage(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String formatedDate() {
    DateTime dT = DateTime.parse(widget.savingsInfo["start_date"]);

    return "${dT.day}${ordinal(dT.day)} " + DateFormat('MMMM').format(DateTime(0, dT.month)) + " " + dT.year.toString();
  }

  String ordinal(int number) {
    if (!(number >= 1 && number <= 100)) {
      throw Exception('Invalid number');
    }

    if (number >= 11 && number <= 13) {
      return 'th';
    }

    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  Widget conColumn(String sub1, String sub2, String title1, String title2, col) {
    return Column(
      children: [
        Row(children: [
          Text(
            sub1,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Spacer(),
          Text(
            sub2,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ]),
        SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                title2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 30,
          thickness: 1,
          color: col,
        ),
      ],
    );
  }
}
