import 'package:six_cash/controller/home_controller.dart';
import 'package:six_cash/controller/menu_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/view/screens/home/widget/animated_card/custom_rect_tween.dart';
import 'package:six_cash/view/screens/home/widget/animated_card/hero_dialogue_route.dart';
import 'package:six_cash/view/screens/home/widget/animated_card/qr_popup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:six_cash/view/screens/home/widget/show_balance.dart';
import 'package:six_cash/view/screens/home/widget/show_name.dart';

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  AppBarBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Expanded(
        child: Container(
          // color: ColorResources.getPrimaryColor(),
          child: Container(
            padding: const EdgeInsets.only(
              top: 54,
              left: Dimensions.PADDING_SIZE_LARGE,
              right: Dimensions.PADDING_SIZE_LARGE,
              bottom: Dimensions.PADDING_SIZE_SMALL,
            ),
            decoration: BoxDecoration(
              color: ColorResources.whiteColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  bottomLeft:
                      Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_LARGE)),
            ),
            child: Row(
              children: [
                const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                Get.find<SplashController>().configModel.themeIndex == '1'
                    ? ShowName()
                    : ShowBalance(profileController: profileController),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 200);
}
