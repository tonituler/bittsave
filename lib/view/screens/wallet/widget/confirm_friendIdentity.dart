import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/wallet/widget/SendUsdFromFriend.dart';

import '../../home/funding_options/fund_bit_express.dart';
import '../../home/funding_usd_wallet_page.dart';

class FriendsIdentity1 extends StatefulWidget {
  const FriendsIdentity1({Key key}) : super(key: key);

  @override
  State<FriendsIdentity1> createState() => _FriendsIdentity1State();
}

class _FriendsIdentity1State extends State<FriendsIdentity1> {
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
              BoldTextTitle(
                data: "Confirm your friend's\nidentification",
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 70, bottom: 10),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                scale: 3,
                                image: AssetImage('assets/image/logo.png')))),
                    Text(
                      'Alan Santos',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1, color: Colors.grey),
                          // color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 90,
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'are you sure',
                            style: kLightTextStyle.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Please confirm your IDs ',
                            style: kLightTextStyle.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 7),
                          CircleAvatar(
                            backgroundColor: Colors.pink,
                            radius: 10,
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Enter amount',
                        style: kLightTextStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 14)),
                    SizedBox(height: 8),
                    Text(
                      '\$0.00',
                      style: kLightTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                          color: Colors.black),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SendUsdFromFriend();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 12),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            'Send now',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(8)),
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
      width: double.infinity,
      child: child,
    );
  }
}
