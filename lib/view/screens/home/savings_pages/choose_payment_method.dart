import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/plan_summary.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

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
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              Text('Choose payment method', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
              SizedBox(height: 8),
              Text('Select your preferred method of payment', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
              InkWell(
                onTap: () {
                  setState(() {
                    paymentMethod = "btc";
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 120, right: 10, left: 10),
                  padding: EdgeInsets.only(left: 12, top: 15, right: 12, bottom: 5),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: (paymentMethod == "btc") ?Colors.pink : Colors.grey,
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
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
              InkWell(
                onTap: () {
                  setState(() {
                    paymentMethod = "usd_wallet";
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                  padding: EdgeInsets.only(left: 12, top: 15, right: 12, bottom: 5),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: (paymentMethod == "usd_wallet") ? Colors.pink : Colors.grey,
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
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                child: newContTap(
                  col: Colors.pink,
                  text: 'Next',
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlanSummary(
                        savingsInfo: {
                          ...widget.savingsInfo,
                          "credit_type":  paymentMethod,
                        },
                    )));
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
