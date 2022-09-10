import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:intl/intl.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';

class PriceConverter {
  static final formatter = new NumberFormat("#,##0.00", "en_US");

  static String convertPrice(BuildContext context, double price,
      {double discount, String discountType}) {
    if (discount != null && discountType != null) {
      if (discountType == 'amount') {
        price = price - discount;
      } else if (discountType == 'percent') {
        price = price - ((discount / 100) * price);
      }
    }
    return '${Get.find<SplashController>().configModel.currencySymbol}${(price).toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  static double convertWithDiscount(BuildContext context, double price,
      double discount, String discountType) {
    if (discountType == 'amount') {
      price = price - discount;
    } else if (discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double calculation(
      double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if (type == 'amount') {
      calculatedAmount = discount * quantity;
    } else if (type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(BuildContext context, String price,
      String discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : '\$'} OFF';
  }

  static double withCashOutCharge(double amount) {
    return (amount *
                Get.find<SplashController>().configModel.cashOutChargePercent) /
            100 +
        amount;
  }

  static double withSendMoneyCharge(double amount) {
    return amount +
        Get.find<SplashController>().configModel.sendMoneyChargeFlat;
  }

  static String availableBalance() {
    String _currencySymbol =
        Get.find<SplashController>().configModel.currencySymbol;
    String _currentBalance =
        Get.find<ProfileController>().userInfo.balance.toStringAsFixed(2);
    return Get.find<SplashController>().configModel.currencyPosition == 'left'
        ? '$_currencySymbol$_currentBalance'
        : '$_currentBalance$_currencySymbol';
  }

  static String newBalanceWithDebit(
      {@required double inputBalance, @required double charge}) {
    String _currencySymbol =
        Get.find<SplashController>().configModel.currencySymbol;
    String _currentBalance = (Get.find<ProfileController>().userInfo.balance -
            (inputBalance + charge))
        .toStringAsFixed(2);
    return Get.find<SplashController>().configModel.currencyPosition == 'left'
        ? '$_currencySymbol$_currentBalance'
        : '$_currentBalance$_currencySymbol';
  }

  static String newBalanceWithCredit({@required double inputBalance}) {
    String _currencySymbol =
        Get.find<SplashController>().configModel.currencySymbol;
    String _currentBalance =
        (Get.find<ProfileController>().userInfo.balance + inputBalance)
            .toStringAsFixed(2);
    return Get.find<SplashController>().configModel.currencyPosition == 'left'
        ? '$_currencySymbol$_currentBalance'
        : '$_currentBalance$_currencySymbol';
  }

  static String balanceInputHint() {
    String _currencySymbol =
        Get.find<SplashController>().configModel.currencySymbol;
    String _balance = '0';
    return Get.find<SplashController>().configModel.currencyPosition == 'left'
        ? '$_currencySymbol$_balance'
        : '$_balance$_currencySymbol';
  }

  static String balanceWithSymbol({String balance}) {
    String _currencySymbol =
        Get.find<SplashController>().configModel.currencySymbol;
    return Get.find<SplashController>().configModel.currencyPosition == 'left'
        ? '$_currencySymbol$balance'
        : '$balance$_currencySymbol';
  }

  static String priceFormater({double balance}) {
    return '${formatter.format(balance)}';
  }

  static String priceFormatInt({int balance}) {
    String val = '${formatter.format(balance)}';
    return val.split(".")[0];
  }

  static double convertToNaira(double price) {
    String value = Get.find<SplashController>().configModel.usdToNgn;
    try {
      double val = double.parse(value.trim());
      price = val * price;
      return price;
    } catch (e) {}

    return 0.0;
  }

  static double convertToDolar(double price) {
    String value = Get.find<SplashController>().configModel.usdToNgn;
    try {
      double val = double.parse(value.trim());
      price = price / val;
      return price;
    } catch (e) {}

    return 0.0;
  }

  static double converBTCToDolar(double btcPrice) {
    String value = Get.find<SplashController>().configModel.btcValue;

    try {
      double val = double.parse(value.trim());
      btcPrice = btcPrice * val;
      return btcPrice;
    } catch (e) {
      // print(e);
    }

    return 0.0;
  }

  static double converDolarToBTC(double price) {
    String value = Get.find<SplashController>().configModel.btcValue;
    try {
      double val = double.parse(value.trim());
      price = price / val;
      return double.parse(price.toStringAsFixed(8));
    } catch (e) {
      // print(e);
    }

    return 0.0;
  }

  static bool isTextFieldPriceValid(
      double availableBalance, String amountFromTextfield) {
    try {
      String enteredPrice = "0.0";
      if (amountFromTextfield.trim() != "") {
        enteredPrice = amountFromTextfield;
      }

      double cleanedPrivce = double.parse(enteredPrice);
      if (availableBalance > cleanedPrivce) {
        return true;
      }
    } catch (e) {}
    return false;
  }
}
