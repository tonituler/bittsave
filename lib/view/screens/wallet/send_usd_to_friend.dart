import 'package:flutter/material.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';
import 'package:six_cash/view/screens/wallet/widget/confirm_friendIdentity.dart';

import '../home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import '../home/funding_usd_wallet_page.dart';

class SendUsdToFriend extends StatefulWidget {
  SendUsdToFriend({Key key, @required this.type}) : super(key: key);
  String type;

  @override
  State<SendUsdToFriend> createState() => _SendUsdToFriendState();
}

class _SendUsdToFriendState extends State<SendUsdToFriend> {
  TextEditingController receipent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4),
                    child: Text('Enter recipient username', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 10),
                    child: Text('Who do you want to send money to?', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey)),
                  ),
                  SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      controller: receipent,
                      decoration: InputDecoration(
                          hintText: 'Bittsave Username',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.pink[50],),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: buttonWithBorder(
                      'Continue',
                      textColor: Colors.white,
                      buttonColor: ColorResources.primaryColor,
                      fontSize: 18.sp,
                      busy: false,
                      fontWeight: FontWeight.w400,
                      height: 54.h,
                      onTap: () async {
                        if (receipent.text.trim().isEmpty) {
                          showCustomSnackBar("Receipent username cannot be empty.");
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (contet) {
                            return FriendsIdentity1(
                              username: receipent.text,
                              type: widget.type,
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
