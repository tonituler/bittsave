import 'package:flutter/material.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/screens/wallet/widget/BTCWallet.dart';
import 'package:bittsave/view/screens/wallet/widget/USDWallet.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _activeIndex = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  sliconIcon(0),
                  sliconIcon(1),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (a) {
                  _activeIndex = a;
                  setState(() {});
                },
                children: [BTCWalletScreen(), USDWalletScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sliconIcon(int i) {
    return Padding(
        padding: EdgeInsets.all(3),
        child: (_activeIndex == i)
            ? Container(
                height: 10,
                width: 20,
                decoration: BoxDecoration(color: ColorResources.primaryColor, borderRadius: BorderRadius.circular(5)),
              )
            : Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(color: ColorResources.blackColor, borderRadius: BorderRadius.circular(5)),
              )

        // Text(
        //   i == 0
        //       ? 'Bio Data'
        //       : i == 1
        //           ? 'Specialization'
        //           : 'Experience',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.w700,
        //     color: i == _activeIndex ? ColorResources.blackColor : ColorResources.primaryColor,
        //   ),
        // ),
        );
  }
}
