import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/data/model/response/contact_model.dart';
import 'package:six_cash/util/app_constants.dart';

class TransactionRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  TransactionRepo({@required this.apiClient, @required this.sharedPreferences});


  Future<Response>  getPurposeListApi() async {
    return await apiClient.getData(AppConstants.CUSTOMER_PURPOSE_URL );
  }

  Future<Response>  sendMoneyApi({@required String phoneNumber, @required double amount,@required String purpose,@required String pin }) async {
    return await apiClient.postData(AppConstants.CUSTOMER_SEND_MONEY,{'phone': phoneNumber, 'amount': amount, 'purpose':purpose, 'pin': pin});
  }

  Future<Response>  requestMoneyApi({@required String phoneNumber, @required double amount}) async {
    return await apiClient.postData(AppConstants.CUSTOMER_REQUEST_MONEY,  {'phone' : phoneNumber, 'amount' : amount});
  }
  Future<Response>  cashOutApi({@required String phoneNumber, @required double amount, @required String pin}) async {
    return await apiClient.postData(AppConstants.CUSTOMER_CASH_OUT, {'phone' : phoneNumber, 'amount' : amount, 'pin' : pin});
  }

  Future<Response>  checkCustomerNumber({@required String phoneNumber}) async {
    return await apiClient.postData(AppConstants.CHECK_CUSTOMER_URI, {'phone' : phoneNumber});
  }

  Future<Response>  checkCustomerUsername({@required String username}) async {
    return await apiClient.postData(AppConstants.CHECK_CUSTOMER_URI, {'username' : username});
  }


  Future<Response>  checkAgentNumber({@required String phoneNumber}) async {
    return await apiClient.postData(AppConstants.CHECK_AGENT_URI, {'phone' : phoneNumber});
  }


  List<ContactModel> getRecentList({@required String type})  {
    String recent = '';
    String _key = type == AppConstants.SEND_MONEY ?
      AppConstants.SEND_MONEY_SUGGEST_LIST : type == AppConstants.CASH_OUT ?
      AppConstants.RECENT_AGENT_LIST : AppConstants.REQUEST_MONEY_SUGGEST_LIST;

    if(sharedPreferences.containsKey(_key)){
      try {
        recent =  sharedPreferences.get(_key);
      }catch(error) {
        recent = '';
      }
    }
    if(recent != null && recent != '' && recent != 'null'){
      return  contactModelFromJson(utf8.decode(base64Url.decode(recent.replaceAll(' ', '+'))));
    }
    return null;

  }

  void addToSuggestList(List<ContactModel> contactModelList,{@required String type}) async {
    String _suggests = base64Url.encode(utf8.encode(contactModelToJson(contactModelList)));
    if(type == 'send_money') {
     await sharedPreferences.setString(AppConstants.SEND_MONEY_SUGGEST_LIST, _suggests);
    }
    else if(type == 'request_money'){
     await sharedPreferences.setString(AppConstants.REQUEST_MONEY_SUGGEST_LIST, _suggests);
    }
    else if(type == "cash_out"){
     await sharedPreferences.setString(AppConstants.RECENT_AGENT_LIST, _suggests);
    }
  }

  Future<Response>  depositRequest({@required double amount}) async {
    return await apiClient.postData(AppConstants.CUSTOMER_DEPOSIT_REQUEST, {'amount': amount});
  }

  Future<Response>  findAgent() async {
    return await apiClient.getData(AppConstants.CUSTOMER_FIND_AGENT);
  }

  Future<Response>  confirmDeposit({@required String depositId}) async {
    return await apiClient.postData(AppConstants.CUSTOMER_DEPOSIT_CONFIRMATION, {'id' : depositId});
  }

  Future<Response>  fundRequest(Map<String, dynamic> credentials) async {
    return await apiClient.postData(AppConstants.CUSTOMER_REQUEST_MONEY, credentials);
  }


  /// LOAN
  Future<Response>  loanCalculation({@required Map<String, dynamic> data}) async {
    return await apiClient.postData(AppConstants.LOAN_CALCULATOR, data);
  }

  Future<Response>  loanApply({@required Map<String, dynamic> data}) async {
    return await apiClient.postData(AppConstants.LOAN_APPLY, data);
  }

  Future<Response>  loanCheck({@required Map<String, dynamic> data}) async {
    return await apiClient.postData(AppConstants.LOAN_CHECK, data);
  }
  Future<Response>  loanList() async {
    return await apiClient.getData(AppConstants.LOAN_LIST);
  }

  Future<Response>  loanPay({@required String loanId}) async {
    return await apiClient.postData(AppConstants.LOAN_PAY, {"id": loanId});
  }


  /// SAVINGS
  Future<Response>  savingsApply({@required Map<String, dynamic> data}) async {
    return await apiClient.postData(AppConstants.PLAN_APPLY, data);
  }

  Future<Response>  updateSavings({@required Map<String, dynamic> data}) async {
    return await apiClient.postData(AppConstants.EDIT_PLAN, data);
  }
  Future<Response>  checkPlan() async {
    return await apiClient.getData(AppConstants.CHECK_PLAN);
  }

  Future<Response>  planList() async {
    return await apiClient.getData(AppConstants.LIST_PLAN);
  }

  Future<Response>  planPreview(Map<String, dynamic> data) async {
    return await apiClient.postData(AppConstants.PLAN_PREVIEW, data);
  }

  Future<Response>  planPaymentHistory({@required Map<String, dynamic> data}) async {
    return await apiClient.postData(AppConstants.PLAN_PAYMENT_HISTORY, data);
  }

  Future<Response>  payPlan({@required Map<String, dynamic> data}) async {
    return await apiClient.postData(AppConstants.PAY_PLAN, data);
  }
  Future<Response>  withdrawPlan() async {
    return await apiClient.getData(AppConstants.WITHDRAWAL_PLAN);
  }


}