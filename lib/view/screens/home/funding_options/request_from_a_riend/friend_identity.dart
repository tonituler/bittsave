import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/deposit_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/base/contact_shimmer.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';
import 'package:six_cash/view/screens/home/funding_options/fund_bit_express.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/request_successful_page.dart';

import '../../../../screens/home/funding_usd_wallet_page.dart';
import 'bitsave_user_request.dart';

class FriendsIdentity extends StatefulWidget {
  FriendsIdentity({Key key, @required this.username}) : super(key: key);
  String username;

  @override
  State<FriendsIdentity> createState() => _FriendsIdentityState();
}

class _FriendsIdentityState extends State<FriendsIdentity> {
  TextEditingController amount = TextEditingController();
  double amountInNaira = 0.00;
  double amountInDolar = 0.00;
  String usdToNgn = "0.00";

  @override
  void initState() {
    super.initState();

    Get.find<DepositController>().checkCustomerUsername(username: widget.username);
  }

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
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<DepositController>(builder: (controller) {
                if (controller.isInitLoading) {
                  return Container(
                    height: 200.h,
                    child: Center(
                      child: ContactShimmer(),
                    ),
                  );
                }

                if (!controller.isInitLoading && controller.funderInfo == null) {
                  return Container(
                    height: 400.h,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 100.h),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              radius: 25,
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "User information is not available",
                              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 70, bottom: 10),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                image: "${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${controller.funderInfo["image"]}",
                                placeholder: Images.avatar,
                                imageErrorBuilder: (context, url, error) => Image.asset(
                                  Images.avatar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            controller.funderInfo["name"],
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
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
                                  style: kLightTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Please confirm your IDs ',
                                  style: kLightTextStyle.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
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
                          Text('Enter amount', style: kLightTextStyle.copyWith(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 14)),
                          SizedBox(height: 8),
                          Expanded(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '\$',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    // height: 80,
                                    child: TextField(
                                      decoration: InputDecoration(border: InputBorder.none, hintText: "0.00"),
                                      controller: amount,
                                      keyboardType: TextInputType.number,
                                      onChanged: (String value) {
                                        // print(usdToNgn);
                                        if (value.trim() != "" && usdToNgn != null && usdToNgn != "") {
                                          try {
                                            double val = double.parse(value.trim());
                                            double uToN = double.parse(usdToNgn);
                                            amountInNaira = val * uToN;
                                            amountInDolar = val;
                                            setState(() {});
                                          } catch (e) {}
                                        }
                                        else {
                                           amountInNaira = 0.0;
                                            amountInDolar = 0.0;
                                            setState(() {});
                                        }
                                      },
                                      style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.2,
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: GetBuilder<DepositController>(
                              builder: (controller) {
                                return buttonWithBorder(
                                  'Request Now',
                                  textColor: Colors.white,
                                  buttonColor: ColorResources.primaryColor,
                                  fontSize: 18.sp,
                                  busy: controller.isLoading,
                                  fontWeight: FontWeight.w400,
                                  height: 54.h,
                                  onTap: () async {
                                    if (amountInDolar == 0) {
                                      showCustomSnackBar("The amount can not be \$0");
                                      return;
                                    }
                                    Response response = await controller.fundRequest({
                                      "username": widget.username,
                                      "amount": amountInDolar,
                                      "note": "",
                                    });
                                    if (response.statusCode == 200) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (contet) {
                                          return RequestSuccessful();
                                        }),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
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
          colors: [Colors.pink[50], Colors.grey[50], Colors.grey[50]],
          // colors: [Colors.pink[50], Color.fromARGB(0, 244, 235, 238), Colors.grey[50]],
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}
