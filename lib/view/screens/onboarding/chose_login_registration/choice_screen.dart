import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/util/app_constants.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/custom_small_button.dart';
import 'package:bittsave/view/screens/onboarding/chose_login_registration/widget/indicator_section.dart';

import '../../../../util/styles.dart';

class ChoiceScreen extends StatelessWidget {
  ChoiceScreen({Key key}) : super(key: key);
  PageController pageContoller = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.getWhiteAndBlack(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 15,
                  child: PageView.builder(
                      itemCount: AppConstants.onboardList.length,
                      scrollDirection: Axis.horizontal,
                      controller: pageContoller,
                      onPageChanged: (page) {
                        Get.find<AuthController>().change(page);
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppConstants.onboardList[index].image,
                                filterQuality: FilterQuality.high,
                                height: MediaQuery.of(context).size.height - 250,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, left: 20, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppConstants.onboardList[index].title,
                                      style: montserratSemiBold.copyWith(
                                        color: ColorResources.getBlackColor(),
                                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      child: Text(
                                        AppConstants.onboardList[index].subtitle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: montserratMedium.copyWith(
                                          color: ColorResources.getOnboardGreyColor().withOpacity(0.5),
                                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Align(alignment: Alignment.topLeft, child: IndicatorSection()),
                ),
                const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
              ],
            ),
          ),
          Container(
            // color: Colors.pink,
            padding: const EdgeInsets.only(
                left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE),
            child: GetBuilder<AuthController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    child: CustomSmallButton(
                      onTap: () {
                        if (controller.page < 2) {
                          int nextPage = controller.page + 1;
                          controller.change(nextPage);
                          pageContoller.animateToPage(nextPage, curve: Curves.easeInOut, duration: Duration(milliseconds: 400));
                        } else {
                          Get.toNamed(RouteHelper.getRegistrationRoute());
                        }
                      },
                      backgroundColor: ColorResources.primaryColor,
                      text: (controller.page < 2) ? "Continue" : "Get Started",
                      textColor: ColorResources.whiteColor,
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

// Text(
// AppConstants.onboardList[index].title,
// style: montserratSemiBold.copyWith(
// color: ColorResources.getBlackColor(),
// fontSize:
// Dimensions.FONT_SIZE_EXTRA_LARGE,
// ),
// textAlign: TextAlign.center,
// ),

//
// Text(
// AppConstants
//     .onboardList[index].subtitle,
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// style: montserratMedium.copyWith(
// color: ColorResources
//     .getOnboardGreyColor()
// .withOpacity(0.5),
// fontSize:
// Dimensions.FONT_SIZE_DEFAULT - 2,
// ),
// textAlign: TextAlign.center,
// ),

//
// Image.asset(
// AppConstants.onboardList[index].image,
// fit: BoxFit.cover,
// ),
