import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/savings_pages/plan2.dart';

class MyPlan1 extends StatefulWidget {
  const MyPlan1({Key key}) : super(key: key);

  @override
  State<MyPlan1> createState() => _MyPlan1State();
}

class _MyPlan1State extends State<MyPlan1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
          child: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 8),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(children: [
                    BackButtons(),
                    Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          image: DecorationImage(
                              image: AssetImage('assets/newImages/PBox.png'))),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('My Plans',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 10, top: 5),
                  child: Text(
                    'Check how your savings is gaining',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                ActiveCont('Active', 'School Fees', '\$01.60', '\$10.00'),
                SizedBox(height: 10),
                ActiveCont('Active', 'My Rent', '\$30.60', '\$90.,00'),
                SizedBox(height: 10),
                ActiveCont('Completed', 'Vacation', '\$30.60', '\$90.,00'),
                SizedBox(height: 10),
                ActiveCont('Completed', 'New Car', '\$30.60', '\$90.,00'),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget ActiveCont(ActiveText, text1, text2, text3) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            color: Colors.pink,
            child: Text(
              '$ActiveText',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Plan2()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              margin: EdgeInsets.only(right: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Plan Name', style: kLightStyle),
                          Expanded(child: Text('$text1', style: kBoldStyle))
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gains', style: kLightStyle),
                          Text('$text2', style: kBoldStyle)
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Earnings', style: kLightStyle),
                          Text('$text3', style: kBoldStyle)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Next payment :',
                          style: kBoldStyle.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 14)),
                      Text(' 9:29 PM | 21-June-2022',
                          style: kLightStyle.copyWith(fontSize: 10))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

const kLightStyle =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 10);

const kBoldStyle =
    TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
