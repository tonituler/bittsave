import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/util/app_constants.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorSection extends StatelessWidget {
  const IndicatorSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      
      builder: (controller) {
      return AnimatedSmoothIndicator(
        activeIndex: controller.page,
        count: AppConstants.onboardList.length,
        curve: Curves.easeOutSine,
        effect: CustomizableEffect(
          dotDecoration: DotDecoration(
            height: 4,
            width: 30,
            borderRadius: BorderRadius.circular(5),
            color: ColorResources.getGreyColor().withOpacity(0.4),
          ),
          activeDotDecoration: DotDecoration(
            height: 4,
            width: 30,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: ColorResources.getPrimaryTextColor(),

          ),
        ),
      );
    });
  }
}
