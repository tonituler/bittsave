import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/screen_shot_widget_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

import '../../../../screens/home/funding_usd_wallet_page.dart';
import '../fund_bit_express.dart';

class RequestSuccessful extends StatefulWidget {
  RequestSuccessful({Key key, this.funder, this.record}) : super(key: key);
  Map<String, dynamic> funder;
  Map<String, dynamic> record;

  @override
  State<RequestSuccessful> createState() => _RequestSuccessfulState();
}

class _RequestSuccessfulState extends State<RequestSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20),
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
                        SizedBox(height: 10),
                        Text(
                          '\$${PriceConverter.priceFormater(balance: double.parse(widget.record["amount"].toString()))}',
                          style: TextStyle(color: Colors.black, fontSize: 30.sp, fontWeight: FontWeight.w400),
                        ),
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
                              image: "${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${widget.funder["image"]}",
                              placeholder: Images.avatar,
                              imageErrorBuilder: (context, url, error) => Image.asset(
                                Images.avatar,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${widget.funder["name"]}',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
                        ),
                        SizedBox(height: 60),
                        GestureDetector(
                          onTap: () {
                            Get.find<ScreenShootWidgetController>().qrCodeDownloadAndShare(
                              qrCode: Get.find<ProfileController>().userInfo.qrCode,
                              phoneNumber: Get.find<ProfileController>().userInfo.phone,
                              isShare: true,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(width: 0.1), borderRadius: BorderRadius.circular(18)),
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
                        SizedBox(height: 60),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: buttonWithBorder(
                            'Back to Dashboard',
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
              ],
            ),
          ),
        ),
      ),
    );
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
}
