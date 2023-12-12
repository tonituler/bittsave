import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/data/api/api_checker.dart';
import 'package:bittsave/data/model/savings_plan.dart';
import 'package:bittsave/data/model/transaction_model.dart';
import 'package:bittsave/data/repository/transaction_repo.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';
import 'package:bittsave/view/screens/wallet/usd_withdrawal_confirmation.dart';

class WalletController extends GetxController implements GetxService {
  final TransactionRepo transactionRepo;
  WalletController({@required this.transactionRepo});
  bool _isLoading = false;
  bool _isLoadingWithdrawal = false;
  bool _isInitLoading = false;
  bool _isVerifying = false;
  bool _isSavingPreviewLoading = false;
  List<SavingsPlan> _savingsList;
  List<Transactions> _usdHistory = [];
  List<Transactions> _btcHistory = [];
  Map<String, dynamic> receipentInfo;
  Map<String, dynamic> planPreviewResponse;

  List<Map<String, dynamic>> _usdCoinHistory = [];
  List<Map<String, dynamic>> _btcCoinHistory = [];

  bool get isLoading => _isLoading;
  bool get isInitLoading => _isInitLoading;
  bool get isSavingPreviewLoading => _isSavingPreviewLoading;
  bool get isLoadingWithdrawal => _isLoadingWithdrawal;
  bool get isVerifying => _isVerifying;
  List<SavingsPlan> get savingsList => _savingsList;
  List<Transactions> get usdHistory => _usdHistory;
  List<Transactions> get btcHistory => _btcHistory;

  List<Map<String, dynamic>> get usdCoinHistory => _usdCoinHistory;
  List<Map<String, dynamic>> get btcCoinHistory => _btcCoinHistory;

  Future<bool> sellBtc(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.sellBTC(data: data);
    if (response.statusCode == 200) {
      // print(response.body);
      _isLoading = false;
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<bool> buyBtc(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.buyBTC(data: data);
    if (response.statusCode == 200) {
      // print(response.body);
      _isLoading = false;
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<bool> sendBTCToWallet(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.sendBTCToBTC(data: data);
    if (response.statusCode == 200) {
      // print(response.body);
      _isLoading = false;
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<Response> checkCustomerUsername({@required String username}) async {
    Response _response;
    if (username == Get.find<ProfileController>().userInfo.username) {
      //todo set message
      showCustomSnackBar('Please_enter_a_different_customer_number'.tr);
    } else {
      _isInitLoading = true;
      receipentInfo = null;
      update();
      Response response = await transactionRepo.checkCustomerUsername(username: username);
      if (response.statusCode == 200) {
        receipentInfo = response.body["data"];
        _isInitLoading = false;
      } else {
        _isInitLoading = false;
        ApiChecker.checkApi(response);
      }
      update();
      _response = response;
    }
    return _response;
  }

  Future<bool> sendBTCToUser(Map<String, dynamic> credentials) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.sendBTCToUser(data: credentials);
    if (response.statusCode == 200) {
      _isLoading = false;
      update();

      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<bool> sendUSDToBITTSAVEUser(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.sendUSDToBITTSAVEUser(data: data);
    if (response.statusCode == 200) {
      // print(response.body);
      _isLoading = false;
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<bool> sendUSDToBTC(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.sendBTCToUser(data: data);
    if (response.statusCode == 200) {
      // print(response.body);
      _isLoading = false;
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<bool> withdrawUSD(BuildContext context, String amount, String accountType) async {
    _isLoadingWithdrawal = true;
    update();
    Response response = await transactionRepo.walletWithdraw(data: {
      "amount": amount,
      "account_type": accountType,
    });
    if (response.statusCode == 200) {
      // print(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UsdWithdrawalConfirmation(),
        ),
      );
      _isLoadingWithdrawal = false;
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoadingWithdrawal = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<bool> getUSDHistory() async {
    Response response = await transactionRepo.getUSDHistory();
    if (response.statusCode == 200) {
      List<Transactions> uList = [];

      for (var item in List<Map<String, dynamic>>.from(response.body["transactions"])) {
        uList.add(Transactions.fromJson(item));
      }

      _usdHistory = uList;
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      ApiChecker.checkApi(response);
    }
    return false;
  }

  Future<bool> getBTCHistory() async {
    Response response = await transactionRepo.getBTCHistory();
    if (response.statusCode == 200) {
      List<Transactions> uList = [];

      for (var item in List<Map<String, dynamic>>.from(response.body["transactions"])) {
        uList.add(Transactions.fromJson(item));
      }

      _btcHistory = uList;

      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      ApiChecker.checkApi(response);
    }
    return false;
  }

  Future<bool> getNOWPayments(String currency) async {
    Response response = await transactionRepo.getNOWPayment(currency);
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> uList = [];

      for (var item in List<Map<String, dynamic>>.from(response.body["listed_crypto"])) {
        uList.add(item);
      }
      if (currency == "usd") {
        _usdCoinHistory = uList;
      }
      if (currency == "btc") {
        _btcCoinHistory = uList;
      }
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      ApiChecker.checkApi(response);
    }
    return false;
  }

  Future<bool> createNOWPayment(Map<String, dynamic> credentials) async {
    _isLoading = true;
    Response response = await transactionRepo.createNOWPayment(credentials);
    if (response.statusCode == 200) {
      if (credentials["pay_currency"].toString().toLowerCase() == "btc") {
        await getNOWPayments("btc");
      }
      if (credentials["pay_currency"].toString().toLowerCase().contains("usd")) {
        await getNOWPayments("usd");
      }
      _isLoading = false;
      return true;
    } else {
      _isLoading = false;
      print("response.hasError");
      print(response.bodyString);
      ApiChecker.checkApi(response);
    }
    return false;
  }

  Future<bool> requeryNOWPayment(Map<String, dynamic> credentials) async {
    _isLoading = true;
    Response response = await transactionRepo.requeryNOWPayment(credentials);
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoading = false;
      return true;
    } else {
      _isLoading = false;
      print("response.hasError");
      print(response.bodyString);
      ApiChecker.checkApi(response);
    }
    return false;
  }
}
