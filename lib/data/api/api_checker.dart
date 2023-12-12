import 'package:get/get.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/data/model/body/error_body.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Get.find<AuthController>().removeCustomerToken();
      Get.offAllNamed(RouteHelper.getLoginRoute(
          countryCode: Get.find<AuthController>().getCustomerCountryCode(), phoneNumber: Get.find<AuthController>().getCustomerNumber()));
      showCustomSnackBar(response.statusText, isIcon: true);
    } else if (response.statusCode == 400) {
      showCustomSnackBar('to_money_login_attempts'.tr);
    } else {
      if (response.body['message'] != null && response.body['message'] != "no request from user") {
        showCustomSnackBar(response.body['message'] ?? ErrorBody.fromJson(response.body).errors.first.message, isError: true);
      }
    }
  }
}
