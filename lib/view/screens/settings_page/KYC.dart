import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/data/model/response/user_info.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/settings_page/kyc_two_steps.dart';

import '../../../util/dimensions.dart';
import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';
import '../home/savings_pages/myPlans.dart';

class KYC extends StatefulWidget {
  const KYC({Key key}) : super(key: key);

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: GetBuilder<ProfileController>(builder: (profileController) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('KYC Requirement', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                      child: Text(
                        'Before you start your KYC process, see what is required of you.',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          ContJ(
                              Image.asset(
                                'assets/newImages/User.png',
                                scale: 3,
                              ),
                              'Usd Wallet',
                              'You can have your money settled in USD. Take note of the price changes in Bitcoin.',
                              Colors.pink,
                              Container(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  'Verified',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.green,
                                ),
                              )),
                          ContJ(
                            Image.asset(
                              'assets/newImages/Table Lamp.png',
                              scale: 3,
                            ),
                            'Document Upload',
                            'You are required to take a photograph of the front or both sides of your government approved ID',
                            Colors.pink,
                            kycStatus(profileController.userInfo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.pink[50],
                                child: Checkbox(
                                  value: isChecked,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                  activeColor: ColorResources.primaryColor,
                                ),
                              ),
                              title: Text(
                                'I here by authorise Bittsave to collect and use my personal information for the purpose of fulfilling regulatory KYC requirements',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 35.w,
                            ),
                            child: buttonWithBorder(
                              'Proceed',
                              textColor: Colors.white,
                              buttonColor: ColorResources.primaryColor,
                              fontSize: 18.sp,
                              busy: false,
                              fontWeight: FontWeight.w400,
                              height: 54.h,
                              diabled: (!isChecked || profileController.userInfo.isKycVerified == 2),
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KycTwoSteps(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget kycStatus(UserInfo userInfo) {
    if (userInfo.isKycVerified == 1) {
      return Container(
        padding: EdgeInsets.all(2),
        child: Text(
          ' Submitted',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorResources.primaryColor.withOpacity(0.2),
          border: Border.all(color: ColorResources.primaryColor.withOpacity(0.2), width: 1),
        ),
      );
    }

    if (userInfo.isKycVerified == 2) {
      return Container(
        padding: EdgeInsets.all(2),
        child: Text(
          ' Verified',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.green,
          border: Border.all(color: Colors.green, width: 1),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(2),
      child: Text(
        ' Not Started',
        style: TextStyle(
          color: Colors.pink,
          fontSize: 10,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        border: Border.all(color: Colors.pink, width: 1),
      ),
    );
  }

  Widget ContJ(Widget widget, String text1, String text2, Color col, Widget child2) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: col, width: 0.8), borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: widget,
        title: Text(
          text1,
          style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          text2,
          style: TextStyle(fontSize: 11.5),
        ),
        trailing: child2,
      ),
    );
  }

  Widget ContJ2() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.pink, width: 1)),
    );
  }
}
