import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/app_constants.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_small_button.dart';
import 'package:six_cash/view/screens/onboarding/chose_login_registration/widget/indicator_section.dart';

class ChoiceScreen extends StatelessWidget {
  ChoiceScreen({Key key}) : super(key: key);
  PageController pageContoller = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.getWhiteAndBlack(),
      body: Column(
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
                          padding: EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Container(
                                height: size.width,
                                width: size.width,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        // height: MediaQuery.of(context).size.height * 0.7,
                                        child: Image.asset(
                                          AppConstants.onboardList[index].image,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              // const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                              // CustomLogo(height: Dimensions.MEDIUM_LOGO, width: Dimensions.MEDIUM_LOGO,),
                              // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                                child: Column(
                                  children: [
                                    Text(
                                      AppConstants.onboardList[index].title,
                                      style: montserratSemiBold.copyWith(
                                        color: ColorResources.getBlackColor(),
                                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: Dimensions.PADDING_SIZE_DEFAULT,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.RADIUS_SIZE_SMALL),
                                      child: Text(
                                        AppConstants.onboardList[index].subtitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: montserratMedium.copyWith(
                                          color: ColorResources.getOnboardGreyColor().withOpacity(0.5),
                                          fontSize: Dimensions.FONT_SIZE_DEFAULT - 2,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            ],
                          ),
                        );
                      }),
                ),
                IndicatorSection(),
                const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
              ],
            ),
          ),
          Container(
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
