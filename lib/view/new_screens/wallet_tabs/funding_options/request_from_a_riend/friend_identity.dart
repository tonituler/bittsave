import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/fund_bit_express.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/request_successful_page.dart';

import '../../funding_usd_wallet_page.dart';
import 'bitsave_user_request.dart';

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
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RequestSuccessful();
                        }));
                      },
                      child: InnerContainer(
                        col: Colors.pink,
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
