import 'package:bittsave/view/base/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';

class BittSaveUserRequest extends StatefulWidget {
  const BittSaveUserRequest({Key key}) : super(key: key);

  @override
  State<BittSaveUserRequest> createState() => _BittSaveUserRequestState();
}

class _BittSaveUserRequestState extends State<BittSaveUserRequest> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackGroundColr(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      BackButtons(),
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0, left: 0, bottom: 80),
                        child: Text(
                          'Request funds from Bittsave user',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      CustomTextField(
                        fillColor: Colors.grey.withOpacity(0.1),
                        hintText: "Bittsave username",
                        isShowBorder: true,
                        controller: usernameController,
                        inputType: TextInputType.name,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 40.h),
                    child: buttonWithBorder(
                      'Continue',
                      textColor: Colors.white,
                      buttonColor: ColorResources.primaryColor,
                      fontSize: 18.sp,
                      busy: false,
                      fontWeight: FontWeight.w400,
                      height: 54.h,
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (contet) {
                            return FriendsIdentity(
                              username: usernameController.text,
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

Widget InnerContainer({double height, Color col, double data, TextStyle style, Widget widget}) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(data)),
      child: Center(
        child: widget,
      ),
    ),
  );
}
