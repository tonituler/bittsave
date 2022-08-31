import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/choose_payment_method.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class ChoosePayMentSource extends StatefulWidget {
  ChoosePayMentSource({Key key, @required this.savingsInfo}) : super(key: key);
  Map<String, dynamic> savingsInfo;

  @override
  State<ChoosePayMentSource> createState() => _ChoosePayMentSourceState();
}

class _ChoosePayMentSourceState extends State<ChoosePayMentSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              BackButtons(),
              Text(
                'Choose payment source',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              SizedBox(height: 8),
              Text('Select your preferred funding source',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return CreatAPlan();
                  // }));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 120, right: 10, left: 10),
                  padding:
                      EdgeInsets.only(left: 12, top: 15, right: 12, bottom: 5),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.pink, width: 1)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Use USD wallet',
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
                        padding: const EdgeInsets.only(right: 15.0),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.pink,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                child: newContTap(
                  col: Colors.pink,
                  text: 'Next',
                  ontap: () {
                    print(widget.savingsInfo);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChoosePaymentMethod(
                        savingsInfo: {
                          ...widget.savingsInfo,
                          "debit_type": "usd_wallet",
                          "debit_type_name": "USD Wallet"
                        },
                      );
                    }));
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
