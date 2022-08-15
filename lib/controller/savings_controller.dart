import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/data/api/api_checker.dart';
import 'package:six_cash/data/model/agent_model.dart';
import 'package:six_cash/data/model/savings_plan.dart';
import 'package:six_cash/data/repository/transaction_repo.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';

class SavingsController extends GetxController implements GetxService {
  final TransactionRepo transacRepo;
  SavingsController({@required this.transacRepo});
  bool _isLoading = false;
  bool _isInitLoading = false;
  bool _isVerifying = false;
  bool _isSavingPreviewLoading = false;
  List<SavingsPlan> _savingsList;
  Map<String, dynamic> funderInfo;
  Map<String, dynamic> planPreviewResponse;

  bool get isLoading => _isLoading;
  bool get isInitLoading => _isInitLoading;
  bool get isSavingPreviewLoading => _isSavingPreviewLoading;
  bool get isVerifying => _isVerifying;
  List<SavingsPlan> get savingsList => _savingsList;

  Future<bool> planApply(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transacRepo.savingsApply(data: data);
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
    Response response = await transacRepo.planPreview(data);
    if (response.statusCode == 200) {
      // print(response.body);
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

  Future<bool> getSavingsList() async {
    _isInitLoading = true;

    // update();
    Response response = await transacRepo.planList();
    print("here");
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
    Response response = await transacRepo.confirmDeposit(depositId: depositId);
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
    Response response = await transacRepo.fundRequest(credentials);
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
      Response response = await transacRepo.checkCustomerUsername(username: username);
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
