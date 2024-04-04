import 'package:flutter/material.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/screens/wallet/widget/BTCWallet.dart';
import 'package:bittsave/view/screens/wallet/widget/USDWallet.dart';

class WalletScreen extends StatefulWidget {
  int index;
  WalletScreen({Key key, @required this.index}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _activeIndex = 0;
  PageController _controller;
  @override
  void initState() {
    _activeIndex = widget.index;
    _controller = PageController(initialPage: widget.index);
    super.initState();
  }

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
                children: [
                  BTCWalletScreen(
                    key: GlobalKey(),
                  ),
                  USDWalletScreen(
                    key: GlobalKey(),
                  )
                ],
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
              ));
  }
}
