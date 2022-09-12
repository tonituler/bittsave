import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/screen_shot_widget_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/images.dart';

import '../../../../util/color_resources.dart';
import '../../deshboard/nav_bar.dart';
import '../../home/funding_options/fund_bit_express.dart';
import '../../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../../home/funding_usd_wallet_page.dart';

class SendUsdFromFriend extends StatefulWidget {
  SendUsdFromFriend({Key key, @required this.requestInfo}) : super(key: key);
  Map<String, dynamic> requestInfo;

  @override
  State<SendUsdFromFriend> createState() => _SendUsdFromFriendState();
}

class _SendUsdFromFriendState extends State<SendUsdFromFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: Center(
                  child: Text(
                    'Request Successful',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w300,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  // height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'Amount',
                        style: kLightTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$${PriceConverter.priceFormater(balance: widget.requestInfo["amount"])}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 10),
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
                            image: "${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${widget.requestInfo["image"]}",
                            placeholder: Images.avatar,
                            imageErrorBuilder: (context, url, error) => Image.asset(
                              Images.avatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.requestInfo["name"],
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Get.find<ScreenShootWidgetController>().qrCodeDownloadAndShare(
                            qrCode: Get.find<ProfileController>().userInfo.qrCode,
                            phoneNumber: Get.find<ProfileController>().userInfo.phone,
                            isShare: true,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          // color: Colors.pink,
                          width: double.infinity,
                          child: ListTile(
                            leading: Icon(
                              Icons.qr_code_2_sharp,
                            ),
                            trailing: Icon(Icons.share, color: ColorResources.primaryColor),
                            title: Text(
                              'share with your friend',
                              maxLines: 1,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                            subtitle: Text(
                              'Click here to share your QR Code',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return NavBarScreen();
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            child: Center(
                                child: Text(
                              'Back to DashBoard',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            )),
                            decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
                          ),
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
  }
}

Widget InnerContainer({double height, Color col, double data, String text, TextStyle style, Widget widget}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(data)),
      child: Center(
        child: widget,
      ),
    ),
  );
}
