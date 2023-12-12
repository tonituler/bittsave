import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/styles.dart';

class ShowBalance extends StatelessWidget {
  final ProfileController profileController;
  const ShowBalance({Key key, this.profileController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        profileController.userInfo != null
            ? Text(PriceConverter.balanceWithSymbol(balance: profileController.userInfo.balance.toString()),
                style: montserratMedium.copyWith(
                  color: ColorResources.whiteColor,
                  fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                ))
            : Text(PriceConverter.balanceWithSymbol(balance: '0.0'),
                style: montserratMedium.copyWith(
                  color: ColorResources.whiteColor,
                  fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                )),
        const SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
        ),
        Text('available_balance'.tr, style: montserratLight.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.whiteColor))
      ],
    );
  }
}
