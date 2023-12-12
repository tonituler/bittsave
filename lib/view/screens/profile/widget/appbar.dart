import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';

class MyAppBar {
  static PreferredSizeWidget myAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: BackButtons(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
