import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/deposit_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/base/contact_shimmer.dart';

import '../../../screens/home/funding_usd_wallet_page.dart';

class PartnersInformation extends StatefulWidget {
  PartnersInformation({Key key, @required this.amountInNaira, @required this.amountInDolar}) : super(key: key);
  double amountInNaira;
  double amountInDolar;

  @override
  State<PartnersInformation> createState() => _PartnersInformationState();
}

class _PartnersInformationState extends State<PartnersInformation> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30 * 60;

  @override
  void initState() {
    super.initState();

    Get.find<DepositController>().findAgent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16),
              child: BackButtons(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 25),
              child: Text(
                "Partner's Information",
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
              // else if (snapshot.hasError) {}
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LText(subtitle: '${PriceConverter.priceFormater(balance: widget.amountInNaira)} NGN', title: "Amount you'll send"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account Name",
                              style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE, fontWeight: FontWeight.w200, color: Colors.black87),
                            ),
                            SizedBox(height: 3),
                            Text(
                              controller.depositAgent.name,
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                            ),
                          ],
                        ),
                      ),
                      LText(subtitle: '${controller.depositAgent.accountNo} - ${controller.depositAgent.bankName}', title: "Bank Transfer"),
                      LText(subtitle: controller.depositAgent.references, title: "References"),
                      SizedBox(
                        height: 10,
                      ),
                      CheckBox(text: 'Do not put any crypto related reference in the narration or remarks e.g Crypto, BTC, Bittsave.'),
                      CheckBox(text: 'Copy the reference provides and paste it in your narration or remarks.'),
                      CheckBox(
                          text:
                              "Be sure to confirm that you've   paid the exact amount into the provided payment channel before clicking the button below."),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 5),
                        child: Center(
                          child: CountdownTimer(
                            endTime: endTime,
                            onEnd: onEnd,
                            widgetBuilder: (context, CurrentRemainingTime time) {
                              if (time == null) {
                                return Text(
                                  '00:00s',
                                  style: TextStyle(color: ColorResources.primaryColor, fontWeight: FontWeight.w500),
                                );
                              }
                              return Text(
                                '${time.min ?? "00"}:${time.sec ?? "00"}s',
                                style: TextStyle(color: ColorResources.primaryColor, fontWeight: FontWeight.w500),
                              );
                            },
                          ),
                          //     child: Text(
                          //   '29.23s',
                          //   style: TextStyle(color: ColorResources.primaryColor, fontWeight: FontWeight.w500),
                          // ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: GetBuilder<DepositController>(
                          builder: (controller) {
                            return buttonWithBorder(
                              'I have sent the money',
                              textColor: Colors.white,
                              buttonColor: ColorResources.primaryColor,
                              fontSize: 18.sp,
                              busy: controller.isLoading,
                              fontWeight: FontWeight.w400,
                              height: 54.h,
                              onTap: () async {
                                Response response = await controller.confirmDeposit(controller.depositAgent.id.toString());
                                if (response.body["message"] == "success") {
                                  Get.offAllNamed(RouteHelper.getNavBarRoute(), arguments: true);
                                }
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      )),
    );
  }

  Widget LText({String subtitle, String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE, fontWeight: FontWeight.w200, color: Colors.black87),
              ),
              SizedBox(height: 3),
              Text(
                "$subtitle",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              FlutterClipboard.copy(subtitle).then((value) => print('copied'));
            },
            icon: Icon(Icons.copy, size: 16, color: ColorResources.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget CheckBox({String text}) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: ListTile(
        minLeadingWidth: 0,
        leading: CircleAvatar(
          radius: 10,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
          backgroundColor: ColorResources.primaryColor,
        ),
        title: Text(
          '$text',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_SMALL + 2),
        ),
      ),
    );
  }

  void onEnd() {
    print('onEnd');
  }
}
