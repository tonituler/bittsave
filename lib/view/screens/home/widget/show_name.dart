import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/home_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
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
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      children: [
                        Text(
                          '${controller.userInfo.fName} ',
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
                          ' ${'@babalola11'}',
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
                : Text('hi_user'.tr,
                    style: montserratLight.copyWith(fontSize: Dimensions.FONT_SIZE_OVER_LARGE, color: ColorResources.whiteColor.withOpacity(0.7)))),
        GetBuilder<HomeController>(builder: (controller) {
          return Text(
            // '${controller.greetingMessage()}',
            'Hey, You have a great day',
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
