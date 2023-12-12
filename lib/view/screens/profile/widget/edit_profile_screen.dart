import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/controller/edit_profile_controller.dart';
import 'package:bittsave/controller/image_controller.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/data/api/api_client.dart';
import 'package:bittsave/data/model/body/edit_profile_body.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/view/base/custom_small_button.dart';
import 'package:bittsave/view/screens/auth/other_info/widget/input_section.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ProfileController profileController = Get.find<ProfileController>();
      phoneController.text = profileController.userInfo.phone ?? '';
      firstNameController.text = profileController.userInfo.fName ?? '';
      lastNameController.text = profileController.userInfo.lName ?? '';
      emailController.text = profileController.userInfo.email ?? '';
      usernameController.text = profileController.userInfo.username ?? '';
      Get.find<EditProfileController>().setGender(profileController.userInfo.gender ?? 'Male');
      Get.find<EditProfileController>().setImage(profileController.userInfo.image ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      return ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        progressIndicator: CircularProgressIndicator(color: Theme.of(context).primaryColor),
        child: WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: BackGroundColr(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                // appBar: AppBar(
                //   leading: BackButtons(),
                //   backgroundColor: Colors.transparent,
                //   elevation: 0,
                // ),
                // appBar: CustomAppbar(
                //   title: 'edit_profile'.tr, onTap: (){
                //    if(Get.find<ImageController>().getImage != null){
                //      Get.find<ImageController>().removeImage();
                //    }

                //   Get.back();
                // },),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: BackButtons(),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: BoldTextTitle(
                              data: 'Profile Setting',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Edit your profile details here.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GetBuilder<ImageController>(
                                  builder: (imageController) {
                                    return imageController.getImage == null
                                        ? GetBuilder<ProfileController>(builder: (proController) {
                                            return Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
                                                child: FadeInImage.assetNetwork(
                                                  imageErrorBuilder: (c, o, s) => Image.asset(Images.avatar, fit: BoxFit.cover),
                                                  placeholder: Images.avatar,
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                  image:
                                                      '${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${proController.userInfo.image}',
                                                ),
                                              ),
                                            );
                                          })
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: ColorResources.getPrimaryTextColor(), width: 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(imageController.getImage.path),
                                                ),
                                              ),
                                            ),
                                          );
                                  },
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: -5,
                                  child: InkWell(
                                    onTap: () => Get.find<AuthController>().requestCameraPermission(fromEditProfile: true),
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).cardColor, boxShadow: [
                                        BoxShadow(
                                          color: ColorResources.getShadowColor().withOpacity(0.08),
                                          blurRadius: 20,
                                          offset: const Offset(0, 3),
                                        )
                                      ]),
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                            //   child: GenderSection(),
                            // ),
                            InputSection(
                              phoneController: phoneController,
                              usernameController: usernameController,
                              fNameController: firstNameController,
                              lNameController: lastNameController,
                              emailController: emailController,
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: Dimensions.PADDING_SIZE_DEFAULT,
                                  right: Dimensions.PADDING_SIZE_DEFAULT,
                                  bottom: Dimensions.PADDING_SIZE_DEFAULT),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomSmallButton(
                                      onTap: () {
                                        _saveProfile(controller);
                                      },
                                      backgroundColor: ColorResources.primaryColor,
                                      text: 'save changes'.tr,
                                      textColor: ColorResources.getWhiteColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: 10,),
                    // Container(
                    //   padding: const EdgeInsets.only(
                    //       left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: CustomSmallButton(
                    //           onTap: () {
                    //             _saveProfile(controller);
                    //           },
                    //           backgroundColor: Theme.of(context).primaryColor,
                    //           text: 'save changes'.tr,
                    //           textColor: ColorResources.getWhiteColor(),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Future _onWillPop(BuildContext context) async {
    if (Get.find<ImageController>().getImage != null) {
      Get.find<ImageController>().removeImage();
      print('====> Remove image from controller');
      return Get.back();
    } else {
      return Get.back();
    }
  }

  _saveProfile(EditProfileController controller) {
    String _fName = firstNameController.text;
    String _lName = lastNameController.text;
    String _email = emailController.text;
    String _gender = controller.gender;
    String _occupation = phoneController.text;
    File _image = Get.find<ImageController>().getImage;

    List<MultipartBody> _multipartBody;
    if (_image != null) {
      _multipartBody = [MultipartBody('image', _image)];
    } else {
      _multipartBody = [];
    }

    EditProfileBody editProfileBody = EditProfileBody(
      fName: _fName,
      lName: _lName,
      gender: _gender,
      occupation: _occupation,
      email: _email,
    );
    controller.updateProfileData(editProfileBody, _multipartBody).then((value) {
      if (value) {
        Get.find<ProfileController>().profileData();
      }
    });
  }
}
