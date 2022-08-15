import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/wallet_controller.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/wallet/buy_btc.dart';
import 'package:six_cash/view/screens/wallet/recieve_Btc.dart';
import 'package:six_cash/view/screens/wallet/sell_btc.dart';

import '../send_btc.dart';

class BTCWalletScreen extends StatefulWidget {
  const BTCWalletScreen({Key key}) : super(key: key);

  @override
  State<BTCWalletScreen> createState() => _BTCWalletScreenState();
}

class _BTCWalletScreenState extends State<BTCWalletScreen> {
  bool isInitialLoad = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 20, left: 8),
              child: BoldTextTitle(
                data: 'BTC Wallet',
              ),
            ),
            // SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 25),
              child: Text(
                'Swipe right to view your USD wallet.',
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
                              'BTC',
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
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Text(
                            '${profileController.userInfo.btcBalance}',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Expanded(
                            child: Text(
                              '\$${PriceConverter.priceFormater(balance: PriceConverter.converBTCToDolar(profileController.userInfo.btcBalance))} | ',
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: Dimensions.FONT_SIZE_LARGE),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              ' ${PriceConverter.priceFormater(balance: profileController.userInfo.btcInSatoshis)} sats',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: Dimensions.FONT_SIZE_LARGE),
                            ),
                          )
                        ]),
                        // Text(
                        //   '\$${PriceConverter.priceFormater(balance: PriceConverter.converBTCToDolar(profileController.userInfo.btcBalance))} | ${profileController.userInfo.btcInSatoshis} sats',
                        //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: Dimensions.FONT_SIZE_LARGE),
                        // )
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
                          builder: (context) => SellBtc(),
                        ),
                      );
                    },
                    icon: "Compass.png",
                    label: "Sell",
                  ),
                  WalletIcons(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyBTC(),
                        ),
                      );
                    },
                    icon: "StopCircle.png",
                    label: "Buy",
                  ),
                  WalletIcons(
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SendBTC()));
                    },
                    icon: "CaretCircleUp.png",
                    label: "Send",
                  ),
                  WalletIcons(
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReceiveBtc()));
                    },
                    icon: "PlayCircle.png",
                    label: "Receive",
                  )
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

                      if (controller.btcHistory.isEmpty) {
                        return Container();
                      } else {
                        return Column(
                          children: controller.btcHistory.map((item) => savingItem(item)).toList(),
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
                        '\$${PriceConverter.priceFormater(balance: PriceConverter.converBTCToDolar(double.parse(plan["amount"].toString())))}',
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

    return controller.getBTCHistory();
  }
}

class WalletIcons extends StatelessWidget {
  final Function ontap;
  final String icon;
  final String label;
  const WalletIcons({this.ontap, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      "assets/image/" + icon,
                      color: ColorResources.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              label ?? "",
              style: TextStyle(
                color: ColorResources.blackColor,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.FONT_SIZE_SMALL + 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
