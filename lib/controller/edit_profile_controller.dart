import 'package:flutter/material.dart';
import 'package:six_cash/controller/image_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/data/api/api_checker.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/data/model/body/edit_profile_body.dart';
import 'package:six_cash/data/model/response/response_model.dart';
import 'package:six_cash/data/repository/auth_repo.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six_cash/view/screens/settings_page/kycScan.dart';

class EditProfileController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  EditProfileController({@required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingKYCUpdate = false;
  bool get isLoadingKYCUpdate => _isLoadingKYCUpdate;

  set isLoadingKYCUpdate(bool value) {
    _isLoadingKYCUpdate = value;
  }

  String _image;
  String get image => _image;
  setImage(String image) {
    _image = image;
  }

  ///gender
  String _gender;
  String get gender => _gender;

  setGender(String select) {
    _gender = select;
    update();
    print(_gender);
  }

  ///occupation
  String _occupation;
  String get occupation => _occupation;

  Future<bool> updateProfileData(EditProfileBody editProfileBody, List<MultipartBody> multipartBody) async {
    _isLoading = true;
    bool _emailValidation = true;
    bool _isSuccess = false;
    update();
    Map<String, String> _allProfileInfo = {
      'f_name': editProfileBody.fName,
      'l_name': editProfileBody.lName,
      'gender': editProfileBody.gender,
      'occupation': editProfileBody.occupation,
      '_method': 'post',
    };
    if (editProfileBody.email != '') {
      bool _emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(editProfileBody.email);

      if (_emailValid) {
        _allProfileInfo.addAll({'email': editProfileBody.email});
      } else {
        _emailValidation = _emailValid;
      }
    }

    if (!_emailValidation) {
      showCustomSnackBar('please_provide_valid_email'.tr);
      _isLoading = false;
      update();
    } else {
      Response response = await authRepo.updateProfile(_allProfileInfo, multipartBody);
      ResponseModel responseModel;
      print('update header : ${response.statusCode}');
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, response.body['message']);
        _isSuccess = true;
        if (Get.find<ImageController>().getImage != null) {
          Get.find<ImageController>().removeImage();
        }
        Get.find<ProfileController>().profileData(loading: true);
        Get.back();
        print(responseModel.message);
        showCustomSnackBar(responseModel.message, isError: false);
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _isSuccess;
  }

  Future<void> updateUserKYCData(Map<String, String> credentials, List<MultipartBody> multipartBody, {Function callback}) async {
    _isLoadingKYCUpdate = true;
    update();
    Response response = await authRepo.updateProfile(credentials, multipartBody);
    ResponseModel responseModel;
    print('update header : ${response.statusCode}');
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body['message']);
      Get.find<ProfileController>().getProfileData(loading: true);
      print(responseModel.message);
      showCustomSnackBar(responseModel.message, isError: false);
      if (callback != null) {
        callback();
      }
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoadingKYCUpdate = false;
    update();
  }
}
