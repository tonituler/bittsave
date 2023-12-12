import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_number/phone_number.dart';
import 'package:bittsave/controller/image_controller.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/selfie_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/controller/varification_controller.dart';
import 'package:bittsave/data/api/api_checker.dart';
import 'package:bittsave/data/api/api_client.dart';
import 'package:bittsave/data/model/agent_model.dart';
import 'package:bittsave/data/model/body/signup_body.dart';
import 'package:bittsave/data/model/response/response_model.dart';
import 'package:bittsave/data/repository/auth_repo.dart';
import 'package:bittsave/data/repository/transaction_repo.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';

class DepositController extends GetxController implements GetxService {
  final TransactionRepo transactionRepo;
  DepositController({@required this.transactionRepo});
  bool _isLoading = false;
  bool _isInitLoading = false;
  bool _isVerifying = false;
  AgentModel _depositAgent;
  Map<String, dynamic> funderInfo;

  bool get isLoading => _isLoading;
  bool get isInitLoading => _isInitLoading;
  bool get isVerifying => _isVerifying;
  AgentModel get depositAgent => _depositAgent;

  Future<Response> depositRequest(double amount) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.depositRequest(amount: amount);
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

  Future<Response> findAgent() async {
    _isInitLoading = true;

    // update();
    Response response = await transactionRepo.findAgent();
    print("here");
    if (response.statusCode == 200) {
      _isInitLoading = false;
      _depositAgent = AgentModel.fromJson(response.body);
    } else {
      _isInitLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return response;
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
