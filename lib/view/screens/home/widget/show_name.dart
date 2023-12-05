import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/home_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';

class ShowName extends StatelessWidget {
  const ShowName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<ProfileController>(
          builder: (controller) => controller.userInfo != null
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.userInfo.fName}',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: montserratLight.copyWith(
                          fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                          color: ColorResources.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '@${controller.userInfo.username}',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: montserratLight.copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: ColorResources.blackColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  'hi_user'.tr,
                  style: montserratLight.copyWith(
                    fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                    color: ColorResources.whiteColor.withOpacity(0.7),
                  ),
                ),
        ),
        SizedBox(
          height: 5,
        ),
        GetBuilder<SplashController>(builder: (controller) {
          return Text(
            // '${controller.greetingMessage()}',
            (controller.configModel.quotes.isNotEmpty)
                ? controller.configModel.quotes[new Random().nextInt(controller.configModel.quotes.length)]["value"]
                : "",
            style: montserratRegular.copyWith(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: ColorResources.blackColor.withOpacity(0.6),
            ),
          );
        }),
      ],
    );
  }
}
