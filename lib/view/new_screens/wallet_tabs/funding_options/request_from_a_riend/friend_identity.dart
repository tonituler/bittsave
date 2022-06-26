import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/fund_bit_express.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/request_successful_page.dart';

import '../../funding_usd_wallet_page.dart';

class FriendsIdentity extends StatefulWidget {
  const FriendsIdentity({Key key}) : super(key: key);

  @override
  State<FriendsIdentity> createState() => _FriendsIdentityState();
}

class _FriendsIdentityState extends State<FriendsIdentity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundColr(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 20, bottom: 30),
                child: Text(
                  "Confirm your friend's\nidentification",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 100, bottom: 10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('assets/image/logo.png')))),
                    Text(
                      'Alan Santos',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.01, color: Colors.grey),
                          // color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 90,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'are you sure',
                            style: kLightTextStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Please confirm your IDs ',
                            style: kLightTextStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 7),
                          CircleAvatar(
                            backgroundColor: Colors.pink[800],
                            radius: 12,
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Enter amount',
                        style: kLightTextStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18)),
                    SizedBox(height: 8),
                    Text(
                      '\$0.00',
                      style: kLightTextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                          color: Colors.black),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.2,
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RequestSuccessful();
                        }));
                      },
                      child: InnerContainer(
                        col: Colors.pink,
                        height: 60,
                        data: 8,
                        widget: Text(
                          'Request Now',
                          style: kLightTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget InnerContainer(
      {double height,
      Color col,
      double data,
      String text,
      TextStyle style,
      Widget widget}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: col, borderRadius: BorderRadius.circular(data)),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}

class BackGroundColr extends StatelessWidget {
  const BackGroundColr({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.pink[50],
            Color.fromARGB(0, 244, 235, 238),
            Colors.grey[50]
          ])),
      child: child,
    );
  }
}
