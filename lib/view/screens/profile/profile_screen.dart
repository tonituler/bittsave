import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/view/base/custom_ink_well.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/profile/profile_settings.dart';
import 'package:six_cash/view/screens/profile/widget/menu_item.dart';
import 'package:six_cash/view/screens/profile/widget/profile_shimmer.dart';
import 'package:six_cash/view/screens/profile/widget/user_info.dart';
import 'package:six_cash/view/screens/settings_page/KYC.dart';
import 'package:six_cash/view/screens/settings_page/payOut.dart';
import 'package:six_cash/view/screens/settings_page/paymentOptions.dart';

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
                              CustomInkWell(child: MenuItem(title: 'History'), onTap: () => Get.toNamed(RouteHelper.history)),
                              CustomInkWell(child: MenuItem(title: 'Notification'), onTap: () => Get.toNamed(RouteHelper.notification)),
                          ],
                        ),
                        MenuSegment(
                          title: "Payment",
                          menuItem: [
                            CustomInkWell(
                                child: MenuItem(title: 'Payment Options'),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentOptions(),),);
                                },
                              ),
                              CustomInkWell(child: MenuItem(title: 'Payouts'), onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PayOut(),),);
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => KYC()));
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
}
