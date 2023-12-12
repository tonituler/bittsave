import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/data/api/api_checker.dart';
import 'package:bittsave/data/model/savings_plan.dart';
import 'package:bittsave/data/repository/transaction_repo.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';

class SavingsController extends GetxController implements GetxService {
  final TransactionRepo transactionRepo;
  SavingsController({@required this.transactionRepo});
  bool _isLoading = false;
  bool _isInitLoading = false;
  bool _isVerifying = false;
  bool _isSavingPreviewLoading = false;
  List<SavingsPlan> _savingsList;
  Map<String, dynamic> funderInfo;
  Map<String, dynamic> planPreviewResponse;
  SavingsPlan planDetails;

  bool get isLoading => _isLoading;
  bool get isInitLoading => _isInitLoading;
  bool get isSavingPreviewLoading => _isSavingPreviewLoading;
  bool get isVerifying => _isVerifying;
  List<SavingsPlan> get savingsList => _savingsList;

  Future<bool> planApply(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.savingsApply(data: data);
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

  Future<bool> planPreview(Map<String, dynamic> data) async {
    _isSavingPreviewLoading = true;
    update();
    Response response = await transactionRepo.planPreview(data);
    if (response.statusCode == 200) {
      planPreviewResponse = response.body;
      _isSavingPreviewLoading = false;
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isSavingPreviewLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<bool> planPay(BuildContext context, String planId, String pin) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.payPlan(planId, pin);
    if (response.statusCode == 200) {
      await checkPlan(planId);
      Navigator.pop(context);

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

  Future<bool> withdrawPlan(BuildContext context, String planId, String pin) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.withdrawPlan(planId, pin);
    if (response.statusCode == 200) {
      await checkPlan(planId);
      Navigator.pop(context);
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

  Future<bool> updateSavings(Map<String, dynamic> data) async {
    // _isLoading = true;
    // update();
    planDetails = SavingsPlan.fromJson({
      ...planDetails.toJson(),
      ...data,
    });
    Response response = await transactionRepo.updateSavings(data: data);
    // Get.put(TransactionRepo(
    //     apiClient: transactionRepo.apiClient,
    //     sharedPreferences: transactionRepo.sharedPreferences));
    if (response.statusCode == 200) {
      // planDetails = {
      //   ...planDetails,
      //   ...data,
      // };
      // print(response.body);
      // _isLoading = false;
      // update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    // update();
    return false;
  }

  Future<bool> checkPlan(String planId) async {
    Response response = await transactionRepo.checkPlan(planId);
    if (response.statusCode == 200) {
      print(response.body);
      planDetails = SavingsPlan.fromJson(response.body);
      update();
      return true;
    } else {
      print("response.hasError");
      print(response.bodyString);
      ApiChecker.checkApi(response);
    }
    // update();
    return false;
  }

  Future<bool> getSavingsList() async {
    _isInitLoading = true;
    // Response response;

    // update();
    Response response = await transactionRepo.planList();
    if (response.statusCode == 200) {
      _isInitLoading = false;
      _savingsList = savingsPlanFromJson(response.body["listed_plan"]);
      return true;
    } else {
      _isInitLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return false;
  }

  Future<Response> confirmDeposit(String depositId) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.confirmDeposit(depositId: depositId);
    if (response.statusCode == 200) {
      // print(response.body);
      _isLoading = false;
      update();
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

  Future<Response> fundRequest(Map<String, dynamic> credentials) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.fundRequest(credentials);
    if (response.statusCode == 200) {
      // print(response.body);
      _isLoading = false;
      update();
    } else {
      print("response.hasError");
      print(response.bodyString);
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

  Future<Response> checkCustomerUsername({@required String username}) async {
    Response _response;
    if (username == Get.find<ProfileController>().userInfo.username) {
      //todo set message
      showCustomSnackBar('Please_enter_a_different_customer_number'.tr);
    } else {
      _isInitLoading = true;
      funderInfo = null;
      update();
      Response response = await transactionRepo.checkCustomerUsername(username: username);
      if (response.statusCode == 200) {
        funderInfo = response.body["data"];
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
}
