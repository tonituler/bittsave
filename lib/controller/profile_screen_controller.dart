import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/controller/theme_controller.dart';
import 'package:bittsave/data/api/api_checker.dart';
import 'package:bittsave/data/model/response/user_info.dart';
import 'package:bittsave/data/repository/profile_repo.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/view/base/animated_custom_dialog.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';
import 'package:bittsave/view/base/logout_dialog.dart';
import 'package:bittsave/view/screens/settings_page/accountAddedSuccessfull.dart';

import 'bootom_slider_controller.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepo profileRepo;
  ProfileController({@required this.profileRepo});
  final BottomSliderController bottomSliderController = Get.find<BottomSliderController>();
  UserInfo _userInfo;
  bool _isLoading = false;

  bool _isLoadingAccountUpdate = false;

  UserInfo get userInfo => _userInfo;
  bool get isLoading => _isLoading;
  bool get isLoadingAccountUpdate => _isLoadingAccountUpdate;

  String _gender = 'Male';
  String get gender => _gender;
  // String _occupation = occupationData[1]['title'];
  // String get occupation => _occupation;
  int select = 0;

  set isLoadingAccountUpdate(bool status) {
    _isLoadingAccountUpdate = status;
  }

  Future<Response> profileData({bool loading = false}) async {
    _isLoading = true;
    update();
    Response response = await profileRepo.getProfileDataApi();
    if (response.statusCode == 200) {
      _userInfo = UserInfo.fromJson(response.body);
      Get.find<AuthController>().setCustomerName('${_userInfo.fName} ${_userInfo.lName}');
      Get.find<AuthController>().setCustomerQrCode(_userInfo.qrCode);
      _isLoading = false;
    } else {
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

  Future<Response> getProfileData({bool loading = false}) async {
    _isLoading = true;
    update();
    Response response = await profileRepo.getProfileDataApi();
    if (response.statusCode == 200) {
      _userInfo = UserInfo.fromJson(response.body);
      _isLoading = false;
    } else {
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

  Future<void> changePin({@required String oldPassword, @required String newPassword, @required String confirmPassword}) async {
    if ((oldPassword.length < 4) || (newPassword.length < 4) || (confirmPassword.length < 4)) {
      showCustomSnackBar('please_input_4_digit_pin'.tr);
    } else if (newPassword != confirmPassword) {
      showCustomSnackBar('pin_not_match'.tr);
    } else {
      _isLoading = true;
      update();
      Response response = await profileRepo.changePinApi(oldPin: oldPassword, newPin: newPassword, confirmPin: confirmPassword);
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteHelper.getLoginRoute(
            countryCode: Get.find<AuthController>().getCustomerCountryCode(), phoneNumber: Get.find<AuthController>().getCustomerNumber()));
      } else {
        // Get.back();
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }

  Future<void> pinVerify(String getPin) async {
    bottomSliderController.setIsLoading = true;
    final Response response = await profileRepo.pinVerifyApi(pin: getPin);

    if (response.statusCode == 200) {
      bottomSliderController.isPinVerified = true;
      bottomSliderController.setIsLoading = false;
      updateTwoFactor();
      bottomSliderController.resetPinField();
    } else {
      bottomSliderController.isPinVerified = false;
      bottomSliderController.setIsLoading = false;
      bottomSliderController.resetPinField();
      Get.back();
      showCustomSnackBar('message');
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> updateTwoFactor() async {
    _isLoading = true;
    update();
    Response response = await profileRepo.updateTwoFactorApi();
    await profileData(loading: true);
    if (response.statusCode == 200) {
      showCustomSnackBar(response.body['message'], isError: false);
      _isLoading = false;
    } else {
      ApiChecker.checkApi(response);
      _isLoading = false;
    }
    update();
  }

  Future<void> updateAccountInfo(BuildContext context, String slug, Map<String, Object> _body) async {
    _isLoadingAccountUpdate = true;
    update();
    Response response = await profileRepo.updateAccountInfo((slug == "create") ? "add-bank" : "edit-bank", {..._body});
    // await getProfileData(loading: false);
    if (response.statusCode == 200) {
      await getProfileData(loading: false);
      showCustomSnackBar(response.body['message'], isError: false);
      _isLoadingAccountUpdate = false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountAdded(
            slug: slug,
          ),
        ),
      );
    } else {
      ApiChecker.checkApi(response);
      _isLoadingAccountUpdate = false;
    }
    update();
  }

  void routeToTwoFactorAuthScreen(String getPin) {
    pinVerify(getPin);
  }

  Future twoFactorOnTap() async {
    await pinVerify(bottomSliderController.pin);
  }

  void twoFactorOnChange() async {
    await updateTwoFactor();
    await profileData(loading: true);
  }

  ///Change theme..
  bool _isSwitched = Get.find<ThemeController>().darkTheme;
  var textValue = 'Switch is OFF';

  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    if (_isSwitched == false) {
      _isSwitched = true;
      textValue = 'Switch Button is ON';
      print('Switch Button is ON');
      Get.find<ThemeController>().toggleTheme();
      update();
    } else {
      _isSwitched = false;
      textValue = 'Switch Button is OFF';
      print('Switch Button is OFF');
      Get.find<ThemeController>().toggleTheme();
      update();
    }
  }

  void logOut(BuildContext context) {
    showAnimatedDialog(
        context,
        CustomDialog(
          icon: Icons.logout,
          title: 'logout'.tr,
          description: 'are_you_sure_you_want_to_logout'.tr,
          onTapFalseText: 'clear_logout'.tr,
          onTapTrueText: 'logout'.tr,
          isFailed: true,
          onTapFalse: () {
            Get.find<AuthController>().change(0);
            Get.find<AuthController>().logout();
            Get.find<SplashController>().removeSharedData();
            Navigator.pop(context);
          },
          onTapTrue: () {
            Get.find<AuthController>().logout();
            Navigator.of(context).pop(true);
          },
        ),
        dismissible: false,
        isFlip: true);
  }

  setGender(String select) {
    _gender = select;
    update();
  }
  // setSelect(int index, String occupation){
  //   select = index;
  //   _occupation = occupation;
  //   update();
  // }
}
