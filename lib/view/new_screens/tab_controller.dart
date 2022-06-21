import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_usd_wallet_page.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/transfer_funds.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/wallet2.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/wallets.dart';

class TabContrller extends StatefulWidget {
  const TabContrller({Key key}) : super(key: key);

  @override
  State<TabContrller> createState() => _TabContrllerState();
}

class _TabContrllerState extends State<TabContrller> {
  List<Widget> screens = [
    Wallet1(),
    FundingUsdWallet(),
    Wallet2(),
    TransferFund(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        iconSize: 24,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.app_badge_fill,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_up_arrow_down), label: '')
        ],
      ),
    );
  }
}
