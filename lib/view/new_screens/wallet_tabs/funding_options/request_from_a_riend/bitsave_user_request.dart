import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/fund_bit_express.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_usd_wallet_page.dart';

class BittSaveUserRequest extends StatefulWidget {
  const BittSaveUserRequest({Key key}) : super(key: key);

  @override
  State<BittSaveUserRequest> createState() => _BittSaveUserRequestState();
}

class _BittSaveUserRequestState extends State<BittSaveUserRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundColr(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: BackButtons(),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 12, bottom: 100),
                  child: Text(
                    'Request from  Bittsave\nUser',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.only(top: 15, left: 20),
                width: double.infinity,
                height: 50,
                color: Colors.pink[50],
                child: Text(
                  'bittsave username',
                  textAlign: TextAlign.left,
                  style: kLightTextStyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 400),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FriendsIdentity();
                  }));
                },
                child: InnerContainer(
                  data: 20,
                  col: Colors.pink,
                  height: 69,
                  style: kLightTextStyle,
                  widget: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              )
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
