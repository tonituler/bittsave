import 'package:bittsave/view/screens/history/history_screen.dart';
import 'package:bittsave/view/screens/home/home_screen.dart';
import 'package:bittsave/view/screens/home/savings_pages/myPlans.dart';
import 'package:bittsave/view/screens/notification/notification_screen.dart';
import 'package:bittsave/view/screens/profile/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/view/screens/wallet/wallet.dart';

class MenuController extends GetxController implements GetxService {
  int _currentTab = 0;
  int get currentTab => _currentTab;
  final List<Widget> screen = [
    HomeScreen(),
    // HistoryScreen(),
    MyPlans(),
    WalletScreen(),
    ProfileScreen()
  ];
  Widget _currentScreen = HomeScreen();
  Widget get currentScreen => _currentScreen;

  resetNavBar() {
    _currentScreen = HomeScreen();
    _currentTab = 0;
  }

  selectHomePage() {
    _currentScreen = HomeScreen();
    _currentTab = 0;
    update();
  }

  selectHistoryPage() {
    _currentScreen = MyPlans(
      shouldNavigate: false,
    );
    _currentTab = 1;
    update();
  }

  selectNotificationPage() {
    _currentScreen = WalletScreen();
    _currentTab = 2;
    update();
  }

  selectProfilePage() {
    _currentScreen = ProfileScreen();
    _currentTab = 3;
    update();
  }
}
