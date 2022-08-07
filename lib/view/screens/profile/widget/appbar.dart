import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';

class MyAppBar {
  static PreferredSizeWidget myAppBar() {
    return AppBar(
      leading: BackButtons(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
