import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';

class MyAppBar {
  static PreferredSizeWidget myAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: BackButtons(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
