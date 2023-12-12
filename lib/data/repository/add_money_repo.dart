import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:bittsave/data/api/api_client.dart';
import 'package:bittsave/util/app_constants.dart';

class AddMoneyRepo {
  final ApiClient apiClient;
  AddMoneyRepo({@required this.apiClient});

  Future<Response> addMoneyApi({@required String amount}) async {
    Map<String, Object> body = {'amount': amount};
    return await apiClient.postData(AppConstants.CUSTOMER_ADD_MONEY, body);
  }
}
