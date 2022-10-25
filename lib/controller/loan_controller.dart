import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_number/phone_number.dart';
import 'package:six_cash/controller/image_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/selfie_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/controller/varification_controller.dart';
import 'package:six_cash/data/api/api_checker.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/data/model/agent_model.dart';
import 'package:six_cash/data/model/body/signup_body.dart';
import 'package:six_cash/data/model/loan_model.dart';
import 'package:six_cash/data/model/response/response_model.dart';
import 'package:six_cash/data/repository/auth_repo.dart';
import 'package:six_cash/data/repository/transaction_repo.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';

class LoanController extends GetxController implements GetxService {
  final TransactionRepo transactionRepo;
  LoanController({@required this.transactionRepo});
  bool _isLoading = false;
  bool _isInitLoading = false;
  bool _isVerifying = false;
  AgentModel _depositAgent;
  Map<String, dynamic> funderInfo;
  Map<String, dynamic> loanCalculationResult;
  List<Loan> loansHistory = [];

  bool get isLoading => _isLoading;
  bool get isInitLoading => _isInitLoading;
  bool get isVerifying => _isVerifying;
  AgentModel get depositAgent => _depositAgent;

  Future<Response> calculateLoan(Map<String, dynamic> data) async {
    _isLoading = true;
    loanCalculationResult = null;
    update();
    Response response = await transactionRepo.loanCalculation(data: data);
    if (response.statusCode == 200) {
      loanCalculationResult = response.body;
      print(response.body);
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

  Future<bool> requestLoan(Map<String, dynamic> data) async {
    _isLoading = true;
    update();
    Response response = await transactionRepo.loanApply(data: data);
    if (response.statusCode == 200) {
      print(response.body);
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

  Future<bool> listLoan() async {
    _isLoading = true;
    update();

    Response response = await transactionRepo.loanList();
    if (response.statusCode == 200) {
      print(response.body);
      if (Map<String, dynamic>.from(response.body).containsKey("listed_loan")) {
        loansHistory = loanFromJson(List<dynamic>.from(response.body["listed_loan"]));
      }
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

  Future<bool> payLoan({@required String loanId}) async {
     _isLoading = true;
    update();
    Response response = await transactionRepo.loanPay(loanId: loanId);
    if (response.statusCode == 200) {
      print(response.body);
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
}
