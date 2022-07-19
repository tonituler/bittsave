import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/home_screen.dart';

class ApplicationSuccessful extends StatefulWidget {
  const ApplicationSuccessful({Key key}) : super(key: key);

  @override
  State<ApplicationSuccessful> createState() => _ApplicationSuccessfulState();
}

class _ApplicationSuccessfulState extends State<ApplicationSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BackButtons(),
              SizedBox(height: 70),
              Center(
                child: Image.asset(
                  'assets/newImages/Take a Loan.png',
                  scale: 0.7,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text('Application Successful', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'Your, account have been credited, You can now check your wallet balance',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: buttonWithBorder(
                  'Back to home',
                  textColor: Colors.white,
                  buttonColor: ColorResources.primaryColor,
                  fontSize: 18.sp,
                  busy: false,
                  fontWeight: FontWeight.w400,
                  height: 54.h,
                  onTap: () async {
                      Get.offAllNamed(RouteHelper.getNavBarRoute(), arguments: true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
