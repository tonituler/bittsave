import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_usd_wallet_page.dart';

class BTCWalletScreen extends StatefulWidget {
  const BTCWalletScreen({Key key}) : super(key: key);

  @override
  State<BTCWalletScreen> createState() => _BTCWalletScreenState();
}

class _BTCWalletScreenState extends State<BTCWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 20, left: 8),
              child: BoldTextTitle(
                data: 'BTC Wallet',
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
              ),
            ),
            // SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 40),
              child: Text(
                'Swipe right to view your USD wallet.',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 20, left: 5, bottom: 20),
              child: PhysicalModel(
                elevation: 8,
                color: Colors.pink,
                shadowColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                child: Container(
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
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          '0.0000000000',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
                        ),
                      ),
                      Text(
                        '\$0.00 | 0 satoshis',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: Dimensions.FONT_SIZE_LARGE),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WalletIcons(
                    ontap: () {},
                    icon: "Compass.png",
                    label: "Sell",
                  ),
                  WalletIcons(
                    ontap: () {},
                    icon: "StopCircle.png",
                    label: "Buy",
                  ),
                  WalletIcons(
                    ontap: () {},
                    icon: "CaretCircleUp.png",
                    label: "Send",
                  ),
                  WalletIcons(
                    ontap: () {},
                    icon: "PlayCircle.png",
                    label: "Receive",
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Divider(color: ColorResources.primaryColor, height: 2, thickness: 1,),
            ),
            SizedBox(height: 10,),
            Text(
                'Recent Transactions',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
              ),
          ],
        ),
      ),
    );
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
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Image.asset("assets/image/" + icon, color: ColorResources.whiteColor,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Text(
              label ?? "",
              style: TextStyle(color: ColorResources.blackColor, fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_SMALL),
            )
          ],
        ),
      ),
    );
  }
}
