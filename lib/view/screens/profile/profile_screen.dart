import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_ink_well.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/profile/profile_settings.dart';
import 'package:six_cash/view/screens/profile/widget/menu_item.dart';
import 'package:six_cash/view/screens/profile/widget/profile_holder.dart';
import 'package:six_cash/view/screens/profile/widget/profile_shimmer.dart';
import 'package:six_cash/view/screens/profile/widget/two_factor_menu.dart';
import 'package:six_cash/view/screens/profile/widget/user_info.dart';
import 'package:six_cash/view/screens/settings_page/KYC.dart';
import 'package:six_cash/view/screens/settings_page/payOut.dart';
import 'package:six_cash/view/screens/settings_page/paymentOptions.dart';

import 'notifications.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find<SplashController>();

    return BackGroundColr(
      child: Scaffold(
          backgroundColor: Colors.transparent,
// appBar: AppbarHomeElement(title: 'profile'.tr),
          body: SafeArea(
            child: GetBuilder<AuthController>(
              builder: (progressController) {
                return ModalProgressHUD(
                  inAsyncCall: progressController.isLoading,
                  progressIndicator: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GetBuilder<ProfileController>(builder: (profileController) {
                          return profileController.isLoading ? ProfileShimmer() : UserInfo(profileController: profileController);
                        }),
                        MenuSegment(
                          title: "General",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: 'Profile Settings'),
                                onTap: () {
                                  Get.toNamed(RouteHelper.getEditProfileRoute())
                                      .then((value) => Get.find<ProfileController>().profileData(loading: true));
                                },
                              ),
                              CustomInkWell(child: MenuItem(title: 'Notification'), onTap: () => Get.toNamed(RouteHelper.notification)),
                          ],
                        ),
                        MenuSegment(
                          title: "Payment",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: 'Payment Options'),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentOptions()));
                                },
                              ),
                              CustomInkWell(child: MenuItem(title: 'Payouts'), onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PayOut()));
                              }),
                          ],
                        ),
                        MenuSegment(
                          title: "Request",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: 'Request Status'),
                                onTap: () => Get.toNamed(RouteHelper.getRequestedMoneyRoute())),
                              CustomInkWell(child: MenuItem(title: 'Send Request'), onTap: () => Get.toNamed(RouteHelper.getRequestedMoneyRoute(from: 'won'))),
                          ],
                        ),
                        MenuSegment(
                          title: "Security",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: 'Change Pin'),
                                onTap: () => Get.toNamed(RouteHelper.getChangePinRoute()),
                                ),
                          ],
                        ),
                        MenuSegment(
                          title: "Verification",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: 'Step 1'),
                                onTap: () {
                                  Get.toNamed(RouteHelper.getEditProfileRoute())
                                      .then((value) => Get.find<ProfileController>().profileData(loading: true));
                                },
                              ),
                          ],
                        ),
                        MenuSegment(
                          title: "Support",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: '24/7 Support'),
                                onTap: () {
                                  Get.toNamed(RouteHelper.getSupportRoute());
                                },
                              ),
                              CustomInkWell(child: MenuItem(title: 'FAQs'), onTap: () => Get.toNamed(RouteHelper.faq)),
                          ],
                        ),
                        MenuSegment(
                          title: "Policies",
                          menuItem: [
                             CustomInkWell(
                                child: MenuItem(title: 'About Us'),
                                onTap: () {
                                  Get.toNamed(RouteHelper.about_us);
                                },
                              ),
                              CustomInkWell(child: MenuItem(title: 'Term of Use'), onTap: () => Get.toNamed(RouteHelper.terms)),
                              CustomInkWell(child: MenuItem(title: 'Privacy Policy'), onTap: () => Get.toNamed(RouteHelper.privacy)),
                          ],
                        ),
                        MenuSegment(
                          title: "Exit",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: 'Logout'),
                                onTap: () {
                                  Get.find<ProfileController>().logOut(context);
                                },
                              ),
                              
                          ],
                        ),
                        // ProfileHeader(title: 'setting'.tr),
                        // Container(
                        //   child: Column(
                        //     children: [
                        //       CustomInkWell(
                        //         child: MenuItem(title: 'edit_profile'.tr),
                        //         onTap: () {
                        //           Get.toNamed(RouteHelper.getEditProfileRoute())
                        //               .then((value) => Get.find<ProfileController>().profileData(loading: true));
                        //         },
                        //       ),
                              
                        //       CustomInkWell(
                        //           child: MenuItem(title: 'change_language'.tr), onTap: () => Get.toNamed(RouteHelper.getChoseLanguageRoute())
                        //           ),
                        //       if (Get.find<SplashController>().configModel.twoFactor)
                        //         GetBuilder<ProfileController>(builder: (profileController) {
                        //           return profileController.isLoading ? TwoFactorShimmer() : TwoFactorMenu();
                        //         }),
                        //       GetBuilder<ProfileController>(
                        //         builder: (profileController) {
                        //           return Container(
                        //             padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                        //             child: Row(
                        //               children: [
                        //                 Padding(
                        //                   padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                        //                   child: Image.asset(
                        //                     Images.change_theme,
                        //                     width: Dimensions.PROFILE_PAGE_ICON_SIZE,
                        //                   ),
                        //                 ),
                        //                 Text('dark_mode'.tr, style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                        //                 Spacer(),
                        //                 Transform.scale(
                        //                   scale: 1,
                        //                   child: Switch(
                        //                     onChanged: profileController.toggleSwitch,
                        //                     value: profileController.isSwitched,
                        //                     activeColor: Colors.black26,
                        //                     activeTrackColor: Colors.grey,
                        //                     inactiveThumbColor: Colors.white,
                        //                     inactiveTrackColor: Colors.black,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           );
                        //         },
                        //       )
                            
                        //     ],
                        //   ),
                        // ),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }

  Widget contTable(
    final String firstText,
    final String secondText,
    final String thirdText,
    final Function firstOnTap,
    final Function secondOnTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '     $firstText',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 5, top: 4),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 16, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: firstOnTap,
                      child: Row(
                        children: [
                          Text('        $secondText'),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.pink,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 16),
                    child: InkWell(
                      onTap: secondOnTap,
                      child: Row(
                        children: [
                          Text('        $thirdText'),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.pink,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contTable2(
    final String firstText,
    final String secondText,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '     $firstText',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 5, top: 4),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 16, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, (MaterialPageRoute(builder: (context) => KYC())));
                      },
                      child: Row(
                        children: [
                          Text('        $secondText'),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.pink,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contTable3(
    final String firstText,
    final String secondText,
    final String thirdText,
    final String forthText,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '     $firstText',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 5, top: 4),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 16, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text('        $secondText'),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.pink,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 16, bottom: 10),
                    child: Row(
                      children: [
                        Text('        $thirdText'),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.pink,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 16),
                    child: Row(
                      children: [
                        Text('        $forthText'),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.pink,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
