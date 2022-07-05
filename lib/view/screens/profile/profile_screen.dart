import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/profile/profile_settings.dart';
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
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/newImages/Photo.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Babalola Anthony',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  '@babalola',
                  style: TextStyle(color: Colors.grey[800], fontSize: 13),
                ),
                Image.asset('assets/newImages/qrCode.png'),
                contTable('General', 'Profile Settings', 'Notifications', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileSettings();
                  }));
                }, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreens()));
                }),
                contTable('Payment', 'Payment Options', 'Payouts', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentOptions()));
                }, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PayOut()));
                }),
                contTable(
                    'Request', 'Request Status', 'Send Request', () {}, () {}),
                contTable2('Security', 'Change Pin'),
                contTable2('Verification', 'Step 1'),
                contTable('Support', '24/ Support', 'FaQs', () {}, () {}),
                contTable3(
                    'Policies', 'About Us', 'Term Of Use', 'Privacy Policy'),
                contTable2('Exit', 'Logout'),
              ],
            ),
          ),
        ),
      ),
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
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, bottom: 5, top: 4),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 16, top: 10, bottom: 10),
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
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, bottom: 5, top: 4),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 16, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            (MaterialPageRoute(builder: (context) => KYC())));
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
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, bottom: 5, top: 4),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 16, top: 10, bottom: 10),
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
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 16, bottom: 10),
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

//
// return Scaffold(
// // appBar: AppbarHomeElement(title: 'profile'.tr),
// body: GetBuilder<AuthController>(
// builder: (progressController) {
// return ModalProgressHUD(
// inAsyncCall: progressController.isLoading,
// progressIndicator: CircularProgressIndicator(color: Theme.of(context).primaryColor),
// child: SingleChildScrollView(
// child: Column(
// children: [
// GetBuilder<ProfileController>(builder: (profileController) {
// return profileController.isLoading ? ProfileShimmer() : UserInfo(profileController: profileController);
// }),
// ProfileHeader(title: 'setting'.tr),
// Container(
// child: Column(
// children: [
// CustomInkWell(
// child: widget.MenuItem(image: Images.edit_profile, title: 'edit_profile'.tr),
// onTap: () {
// Get.toNamed(RouteHelper.getEditProfileRoute())
//     .then((value) => Get.find<ProfileController>().profileData(loading: true));
// }),
// CustomInkWell(
// child: widget.MenuItem(image: Images.request_list_image2, title: 'requests'.tr),
// onTap: () => Get.toNamed(RouteHelper.getRequestedMoneyRoute())),
// CustomInkWell(
// child: widget.MenuItem(image: Images.my_requested_list_image, title: 'send_requests'.tr),
// onTap: () => Get.toNamed(RouteHelper.getRequestedMoneyRoute(from: 'won'))),
// CustomInkWell(
// child: widget.MenuItem(image: Images.pinChange_logo, title: 'change_pin'.tr),
// onTap: () => Get.toNamed(RouteHelper.getChangePinRoute())),
// CustomInkWell(
// child: widget.MenuItem(image: Images.language_logo, title: 'change_language'.tr),
// onTap: () => Get.toNamed(RouteHelper.getChoseLanguageRoute())),
// if (Get.find<SplashController>().configModel.twoFactor)
// GetBuilder<ProfileController>(builder: (profileController) {
// return profileController.isLoading ? TwoFactorShimmer() : TwoFactorMenu();
// }),
// GetBuilder<ProfileController>(
// builder: (profileController) {
// return Container(
// padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
// child: Image.asset(
// Images.change_theme,
// width: Dimensions.PROFILE_PAGE_ICON_SIZE,
// ),
// ),
// Text('dark_mode'.tr, style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
// Spacer(),
// Transform.scale(
// scale: 1,
// child: Switch(
// onChanged: profileController.toggleSwitch,
// value: profileController.isSwitched,
// activeColor: Colors.black26,
// activeTrackColor: Colors.grey,
// inactiveThumbColor: Colors.white,
// inactiveTrackColor: Colors.black,
// ),
// ),
// ],
// ),
// );
// },
// )
// ],
// ),
// ),
// ProfileHeader(title: '6cash_support'.tr),
// Column(
// children: [
// if (((splashController.configModel.companyEmail != null) || (splashController.configModel.companyPhone != null)))
// CustomInkWell(
// child: widget.MenuItem(image: Images.support_logo, title: '24_support'.tr),
// onTap: () => Get.toNamed(RouteHelper.getSupportRoute())),
// CustomInkWell(child: widget.MenuItem(image: Images.question_logo, title: 'faq'.tr), onTap: () => Get.toNamed(RouteHelper.faq))
// ],
// ),
// ProfileHeader(title: 'policies'.tr),
// Column(
// children: [
// CustomInkWell(
// child: widget.MenuItem(image: Images.about_us, title: 'about_us'.tr), onTap: () => Get.toNamed(RouteHelper.about_us)),
// CustomInkWell(child: widget.MenuItem(image: Images.terms, title: 'terms'.tr), onTap: () => Get.toNamed(RouteHelper.terms)),
// CustomInkWell(
// child: widget.MenuItem(image: Images.privacy, title: 'privacy_policy'.tr), onTap: () => Get.toNamed(RouteHelper.privacy))
// ],
// ),
// ProfileHeader(title: 'account'.tr),
// Column(
// children: [
// CustomInkWell(
// child: widget.MenuItem(image: Images.log_out, title: 'logout'.tr),
// onTap: () => Get.find<ProfileController>().logOut(context)),
// SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
// ],
// )
// ],
// ),
// ),
// );
// },
// ));
