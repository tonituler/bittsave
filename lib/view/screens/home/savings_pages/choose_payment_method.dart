import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/savings_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/home/savings_pages/plan_summary.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';

class ChoosePaymentMethod extends StatefulWidget {
  ChoosePaymentMethod({Key key, @required this.savingsInfo}) : super(key: key);
  Map<String, dynamic> savingsInfo;

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  String paymentMethod = "usd_wallet";

  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<SavingsController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                BackButtons(),
                Text('Choose payment method',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22)),
                SizedBox(height: 8),
                Text('Select your preferred method of payment',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
                Container(
                  margin: EdgeInsets.only(top: 120, right: 10, left: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        paymentMethod = "usd_wallet";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 12, top: 15, right: 12, bottom: 5),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: (paymentMethod == "usd_wallet")
                              ? Colors.pink
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fund my USD wallet',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Fund your plan with only your USD\nwallet',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.pink,
                              child: Center(
                                child: Text(
                                  '\$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        paymentMethod = "btc";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 12, top: 15, right: 12, bottom: 5),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: (paymentMethod == "btc")
                              ? Colors.pink
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fund my BTC wallet',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Fund your plan with only your BTC\nwallet',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.pink,
                              child: Icon(
                                Icons.currency_bitcoin,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    'Next',
                    textColor: Colors.white,
                    buttonColor: ColorResources.primaryColor,
                    fontSize: 18.sp,
                    busy: controller.isSavingPreviewLoading,
                    fontWeight: FontWeight.w400,
                    height: 54.h,
                    onTap: () async {
                      bool response = await controller.planPreview({
                        ...widget.savingsInfo,
                        "credit_type": paymentMethod,
                        "credit_type_name":
                            (paymentMethod == "btc") ? "BTC" : "USD Wallet",
                        "auto_invest": 1,
                      });

                      if (response) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanSummary(
                              planPreview: controller.planPreviewResponse,
                              savingsInfo: {
                                ...widget.savingsInfo,
                                "credit_type": paymentMethod,
                                "credit_type_name": (paymentMethod == "btc")
                                    ? "BTC"
                                    : "USD Wallet",
                              },
                            ),
                          ),
                        );
                      }
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
}
