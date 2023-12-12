import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/screens/home/widget/show_balance.dart';
import 'package:bittsave/view/screens/home/widget/show_name.dart';

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  AppBarBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Container(
        padding: const EdgeInsets.only(
          top: 80,
          left: Dimensions.PADDING_SIZE_LARGE,
          right: Dimensions.PADDING_SIZE_LARGE,
          bottom: Dimensions.PADDING_SIZE_SMALL,
        ),
        decoration: BoxDecoration(
          color: ColorResources.whiteColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_LARGE)),
        ),
        child: Row(
          children: [
            // const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Get.find<SplashController>().configModel.themeIndex == '1' ? ShowName() : ShowBalance(profileController: profileController),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 200);
}
