import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/edit_profile_controller.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/main.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/base/custom_drop_down.dart';
import 'package:bittsave/view/screens/profile/widget/appbar.dart';
import 'package:bittsave/view/screens/settings_page/kycScan.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class KycTwoSteps extends StatefulWidget {
  const KycTwoSteps({Key key}) : super(key: key);

  @override
  State<KycTwoSteps> createState() => _KycTwoStepsState();
}

class _KycTwoStepsState extends State<KycTwoSteps> {
  String state;
  String country;
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    EditProfileController editProfileController = Get.find<EditProfileController>();
    ProfileController profileController = Get.find<ProfileController>();
    SplashController splashController = Get.find<SplashController>();

    cityController.text = profileController.userInfo.city ?? '';
    addressController.text = profileController.userInfo.address ?? '';
    houseNoController.text = profileController.userInfo.houseNo ?? '';
    editProfileController.isLoadingKYCUpdate = false;
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar.myAppBar(),
        body: GetBuilder<EditProfileController>(builder: (profileEditController) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text('KYC-Step Two', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Let us know your location as it reflect on your proof of Identification',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 2),
                    child: GetBuilder<SplashController>(builder: (splashController) {
                      return CustomDropDownButton(
                        busy: false,
                        list: ["Nigeria"],
                        onChanged: (value) {
                          country = value;
                          setState(() {});
                        },
                        title: "Country",
                        hintText: "Select a country",
                        backgroundColor: Colors.grey[200],
                        bordered: DropDownType.Bordered,
                        value: country,
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 2),
                    child: GetBuilder<SplashController>(builder: (splashController) {
                      return CustomDropDownButton(
                        busy: false,
                        list: splashController.configModel.stateRegion.map((value) => value["name"].toString()).toList(),
                        onChanged: (value) {
                          state = value;
                          setState(() {});
                        },
                        title: "State/Region/Province",
                        hintText: "Select a state",
                        backgroundColor: Colors.grey[200],
                        bordered: DropDownType.Bordered,
                        value: state,
                      );
                    }),
                  ),
                  textCont('City', 'Ikeja', controller: cityController),
                  textCont('House no', 'Plot 505 or House 5', controller: houseNoController),
                  textCont('Address', 'Street name', controller: addressController),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 35.w,
                    ),
                    child: buttonWithBorder(
                      'Save and continue',
                      textColor: Colors.white,
                      buttonColor: ColorResources.primaryColor,
                      fontSize: 18.sp,
                      busy: profileEditController.isLoadingKYCUpdate,
                      fontWeight: FontWeight.w400,
                      height: 54.h,
                      onTap: () async {
                        await profileEditController.updateUserKYCData({
                          'city': cityController.text,
                          'address': addressController.text,
                          'country': country,
                          'state_region': state,
                          'house_no': houseNoController.text,
                          '_method': 'post',
                        }, [], callback: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => KycScan()));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget textCont(String titleText, String hintText, {TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 12, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titleText',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: '    $hintText',
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget textCont2(String titleText, String hintText, Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 12, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titleText',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                filled: true,
                suffixIcon: icon,
                fillColor: Colors.grey[200],
                hintText: '    $hintText',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
