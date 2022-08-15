import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/deposit_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/wallet_controller.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/wallet/send_usd.dart';
import 'package:six_cash/view/screens/wallet/widget/BTCWallet.dart';
import 'package:six_cash/view/screens/wallet/widget/WithDraw.dart';

class USDWalletScreen extends StatefulWidget {
  const USDWalletScreen({Key key}) : super(key: key);

  @override
  State<USDWalletScreen> createState() => _USDWalletScreenState();
}

class _USDWalletScreenState extends State<USDWalletScreen> {
  bool isInitialLoad = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 20,
          right: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 20, left: 8),
              child: BoldTextTitle(
                data: 'USD Wallet',
              ),
            ),
            // SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 25),
              child: Text(
                'Swipe left to view your BTC wallet.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 10, left: 5, bottom: 10),
              child: PhysicalModel(
                elevation: 8,
                color: Colors.pink,
                shadowColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                child: GetBuilder<ProfileController>(builder: (profileController) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'USD',
                              style: TextStyle(color: Colors.white, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Image.asset(
                              "assets/image/CurrencyBtc.png",
                              height: Dimensions.FONT_SIZE_EXTRA_LARGE,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            '\$${PriceConverter.priceFormater(balance: profileController.userInfo.usdBalance)}',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WalletIcons(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SendUsd();
                          },
                        ),
                      );
                    },
                    icon: "CaretCircleUp.png",
                    label: "Send",
                  ),
                  WalletIcons(
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WithDrawPaymentOptions()));
                    },
                    icon: "Compass.png",
                    label: "Withdraw",
                  ),
                  WalletIcons(
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return FundingUsdWallet();
                      }));
                    },
                    icon: "StopCircle.png",
                    label: "Deposit",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Divider(
                color: ColorResources.primaryColor,
                height: 2,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Recent Transactions',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE - 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<WalletController>(
              builder: (controller) {
                return FutureBuilder(
                  future: loadSavings(controller),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      isInitialLoad = true;
                      return Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      isInitialLoad = true;
                      return Container();
                    } else if (snapshot.hasData) {
                      isInitialLoad = true;

                      print(controller.usdHistory.length);

                      if (controller.usdHistory.isEmpty) {
                        return Container();
                      } else {
                        return Column(
                          children: controller.usdHistory.map((item) => savingItem(item)).toList(),
                        );
                      }
                    } else {
                      isInitialLoad = true;
                      return Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget savingItem(dynamic plan) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 25,
            child: Center(
              child: Text(
                (plan["transaction_type"].toLowerCase() == "send_money") ? 'You Send' : "You Deposit",
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: ColorResources.primaryColor,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${PriceConverter.priceFormater(balance: double.parse(plan["amount"].toString()))}',
                        style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 10),
                      Text(
                        plan["user_info"]["name"],
                        style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 10),
                      Center(
                        child: Text(
                          formatedDate(plan["created_at"]),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatedDate(String date) {
    DateTime dT = DateTime.parse(date);

    return DateFormat('hh:mm a').format(DateTime(0, dT.month, dT.day, dT.hour, dT.minute)) +
        " | " "${dT.day}-" +
        DateFormat('MMMM').format(DateTime(0, dT.month)) +
        "-" +
        dT.year.toString();
  }

  Future<bool> loadSavings(WalletController controller) async {
    if (isInitialLoad == true) {
      return false;
    }

    return controller.getUSDHistory();
  }

}
