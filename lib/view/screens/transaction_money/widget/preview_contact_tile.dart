import 'package:get/get.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/data/model/response/contact_model.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/styles.dart';
import 'package:flutter/material.dart';

class PreviewContactTile extends StatelessWidget {
  final ContactModel contactModel;
  const PreviewContactTile({
    Key key,
    @required this.contactModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String phoneNumber = contactModel.phoneNumber;
    if (phoneNumber.contains('-')) {
      phoneNumber.replaceAll('-', '');
    } else if (!phoneNumber.contains(Get.find<AuthController>().getCustomerCountryCode())) {
      phoneNumber = Get.find<AuthController>().getCustomerCountryCode() + phoneNumber.substring(1).trim();
    }
    return ListTile(
      title:
          Text(contactModel.name == null ? phoneNumber : contactModel.name, style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
      subtitle: phoneNumber.length <= 0
          ? SizedBox()
          : Text(
              phoneNumber,
              style: montserratLight.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.getGreyBaseGray1()),
            ),
    );
  }
}
