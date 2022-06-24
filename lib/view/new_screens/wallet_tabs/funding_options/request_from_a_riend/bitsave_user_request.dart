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
              SizedBox(height: 20),
              BackButtons(),
              BoldTextTitle(
                data: 'Request from Bittsave\nUser',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.only(top: 15, left: 20),
                  width: double.infinity,
                  height: 50,
                  color: Colors.pink[50],
                  child: Text(
                    'bittsave username',
                    textAlign: TextAlign.left,
                    style: kLightTextStyle.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                  ),
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
                  col: Colors.pink,
                  widget: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
}

class InnerContainer extends StatelessWidget {
  const InnerContainer({
    Key key,
    this.widget,
    this.col,
  }) : super(key: key);
  final Color col;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
