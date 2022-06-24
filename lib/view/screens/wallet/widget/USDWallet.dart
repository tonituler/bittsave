import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/wallet/widget/BTCWallet.dart';

class USDWalletScreen extends StatefulWidget {
  const USDWalletScreen({Key key}) : super(key: key);

  @override
  State<USDWalletScreen> createState() => _USDWalletScreenState();
}

class _USDWalletScreenState extends State<USDWalletScreen> {
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
                // fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
              ),
            ),
            // SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 40),
              child: Text(
                'Swipe left to view your BTC wallet.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: Dimensions.FONT_SIZE_DEFAULT),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 20, left: 5, bottom: 20),
              child: PhysicalModel(
                elevation: 8,
                color: Colors.pink,
                shadowColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'USD',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                fontWeight: FontWeight.w500),
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
                          '\$0.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
                        ),
                      ),
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
                    icon: "Notification.png",
                    label: "Send",
                  ),
                  WalletIcons(
                    ontap: () {},
                    icon: "Notification.png",
                    label: "Withdraw",
                  ),
                  WalletIcons(
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FundingUsdWallet();
                      }));
                    },
                    icon: "Notification.png",
                    label: "Deposit",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Divider(
                color: ColorResources.primaryColor,
                height: 2,
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
