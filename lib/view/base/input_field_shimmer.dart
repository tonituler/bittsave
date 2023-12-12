import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/util/styles.dart';

class InputFieldShimmer extends StatelessWidget {
  const InputFieldShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[200],
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_LARGE, bottom: Dimensions.PADDING_SIZE_LARGE),
                      child: TextField(
                        enabled: false,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        style: montserratMedium.copyWith(fontSize: 34, color: ColorResources.getPrimaryColor()),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '${PriceConverter.balanceInputHint()}',
                            hintStyle: montserratMedium.copyWith(fontSize: 34, color: Colors.grey)),
                      ),
                    ),
                    Center(
                        child: Text('${'available_balance'.tr} ${PriceConverter.availableBalance()}',
                            style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.getGreyBaseGray1()))),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  ],
                ),
              ),
              Positioned(
                  left: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_EXTRA_LARGE, child: Image.asset(Images.logo, width: 50.0)),
              Positioned(right: 10, bottom: 5, child: Image.asset(Images.input_stack_desing, width: 150.0, filterQuality: FilterQuality.high)),
            ],
          ),
          Container(height: Dimensions.DIVIDER_SIZE_MEDIUM),
        ],
      ),
    );
  }
}
