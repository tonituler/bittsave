import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/controller/wallet_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/base/contact_shimmer.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';
import 'package:bittsave/view/screens/wallet/widget/SendUsdFromFriend.dart';

import '../../home/funding_options/fund_bit_express.dart';
import '../../home/funding_usd_wallet_page.dart';

class FriendsIdentity1 extends StatefulWidget {
  FriendsIdentity1({Key key, @required this.username, @required this.type}) : super(key: key);
  String username;
  String type;

  @override
  State<FriendsIdentity1> createState() => _FriendsIdentity1State();
}

class _FriendsIdentity1State extends State<FriendsIdentity1> {
  TextEditingController amount = TextEditingController();
  double amountInNaira = 0.00;
  double amountInDolar = 0.00;
  String usdToNgn = "0.00";

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Get.find<WalletController>().checkCustomerUsername(username: widget.username);
    });
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
              SizedBox(height: 20),
              BackButtons(),
              BoldTextTitle(
                data: "Confirm your friend's\nidentification",
              ),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<WalletController>(builder: (controller) {
                if (controller.isInitLoading) {
                  return Container(
                    height: 200.h,
                    child: Center(
                      child: ContactShimmer(),
                    ),
                  );
                }

                if (!controller.isInitLoading && controller.receipentInfo == null) {
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
                      height: 600,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 10),
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
                                image: "${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${controller.receipentInfo["image"]}",
                                placeholder: Images.avatar,
                                imageErrorBuilder: (context, url, error) => Image.asset(
                                  Images.avatar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            controller.receipentInfo["name"],
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                          SizedBox(height: 40),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.1, color: Colors.grey),
                              // color: Colors.lightGreenAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
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
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'This is Wrong identity',
                                  style: kLightTextStyle.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 7),
                                GestureDetector(
                                  onTap: () {
                                    Get.offAllNamed(RouteHelper.getNavBarRoute(), arguments: true);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    radius: 10,
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Enter amount',
                            style: kLightTextStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 0),
                          Expanded(
                            flex: 0,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '         \$',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    // height: 80,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "0.00",
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 35.sp,
                                          )),
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
                                        } else {
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
                          // Expanded(
                          //   child: Center(
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         Text(
                          //           '\$',
                          //           style: TextStyle(
                          //             color: Colors.black,
                          //             fontWeight: FontWeight.w700,
                          //             fontSize: 35.sp,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 10,
                          //         ),
                          //         SizedBox(
                          //           width: 150,
                          //           // height: 80,
                          //           child: TextField(
                          //             decoration: InputDecoration(
                          //                 border: InputBorder.none,
                          //                 hintText: "0.00"),
                          //             controller: amount,
                          //             keyboardType: TextInputType.number,
                          //             onChanged: (String value) {
                          //               // print(usdToNgn);
                          //               if (value.trim() != "" &&
                          //                   usdToNgn != null &&
                          //                   usdToNgn != "") {
                          //                 try {
                          //                   double val =
                          //                       double.parse(value.trim());
                          //                   double uToN =
                          //                       double.parse(usdToNgn);
                          //                   amountInNaira = val * uToN;
                          //                   amountInDolar = val;
                          //                   setState(() {});
                          //                 } catch (e) {}
                          //               } else {
                          //                 amountInNaira = 0.0;
                          //                 amountInDolar = 0.0;
                          //                 setState(() {});
                          //               }
                          //             },
                          //             style: TextStyle(
                          //                 fontSize: 35.sp,
                          //                 fontWeight: FontWeight.w700),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.2,
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0, right: 12, left: 0, bottom: 0),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (widget.type != "USD")
                                    InnerContainer(
                                      height: 50,
                                      col: Colors.white,
                                      data: 5,
                                      widget: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Amount in BTC",
                                            style: kLightTextStyle.copyWith(color: Colors.grey),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '${PriceConverter.converDolarToBTC(amountInDolar)}BTC',
                                            style: kLightTextStyle.copyWith(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                      style: kLightTextStyle,
                                    ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: GetBuilder<WalletController>(
                                      builder: (walletController) {
                                        return buttonWithBorder(
                                          "Send Now",
                                          textColor: Colors.white,
                                          buttonColor: ColorResources.primaryColor,
                                          fontSize: 18.sp,
                                          busy: walletController.isLoading,
                                          fontWeight: FontWeight.w400,
                                          height: 54.h,
                                          onTap: () async {
                                            if (amountInDolar == 0) {
                                              showCustomSnackBar("The amount can not be \$0");
                                              return;
                                            }
                                            bool response;
                                            if (widget.type == "USD") {
                                              response = await walletController.sendUSDToBITTSAVEUser({
                                                "username": widget.username,
                                                "amount": amountInDolar,
                                              });
                                            } else {
                                              response = await walletController.sendBTCToUser({
                                                "username": widget.username,
                                                "amount": amountInDolar,
                                              });
                                            }

                                            if (response) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (contet) {
                                                  return SendUsdFromFriend(
                                                    requestInfo: {
                                                      ...controller.receipentInfo,
                                                      "username": widget.username,
                                                      "amount": amountInDolar,
                                                    },
                                                  );
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
                        ],
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 40),
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
              begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.pink[50], Color.fromARGB(0, 244, 235, 238), Colors.grey[50]])),
      width: double.infinity,
      child: child,
    );
  }
}
