import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/banner_controller.dart';
import 'package:six_cash/controller/home_controller.dart';
import 'package:six_cash/controller/notification_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/requested_money_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/controller/transaction_controller.dart';
import 'package:six_cash/controller/transaction_history_controller.dart';
import 'package:six_cash/controller/websitelink_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/screens/home/widget/app_bar.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/expandable_contant.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/persistent_header.dart';
import 'package:six_cash/view/screens/home/widget/first_card_portion.dart';
import 'package:six_cash/view/screens/home/widget/linked_website_portion.dart';
import 'package:six_cash/view/screens/home/widget/secend_card_portion.dart';
import 'package:six_cash/view/screens/home/widget/shimmer/web_site_shimmer.dart';
import 'package:six_cash/view/screens/home/widget/third_card_portion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirst = true;
  Future<void> _loadData(BuildContext context, bool reload) async {
    await Get.find<ProfileController>().profileData(loading: true).then((value) {
      if (value.isOk) {
        Get.find<BannerController>().getBannerList(reload);
        Get.find<RequestedMoneyController>().getRequestedMoneyList(1, context, reload: reload);
        Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(1, reload: reload);
        Get.find<TransactionHistoryController>().getTransactionData(1, reload: reload);
        Get.find<WebsiteLinkController>().getWebsiteList();
        Get.find<NotificationController>().getNotificationList();
        Get.find<TransactionMoneyController>().getPurposeList();
        Get.find<TransactionMoneyController>().fetchContact();
        if (reload) {
          Get.find<SplashController>().getConfigData();
        }
      }
    });
  }

  @override
  void initState() {
    _loadData(context, true);
    isFirst = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        //backgroundColor: Theme.of(context).canvasColor,
        backgroundColor: ColorResources.getBackgroundColor(),
        appBar: AppBarBase(),
        body: ExpandableBottomSheet(
          enableToggle: true,
          background: RefreshIndicator(
            onRefresh: () async {
              await _loadData(context, true);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: GetBuilder<SplashController>(builder: (splashController) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(color: ColorResources.primaryColor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Investment Balance',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: rubikLight.copyWith(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: ColorResources.whiteColor,
                            ),
                          ),
                          Text(
                            '\$0.00',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: rubikLight.copyWith(
                              fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                              color: ColorResources.whiteColor,
                            ),
                          ),
                          Text(
                            '0.00000000 BTC',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: rubikLight.copyWith(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: ColorResources.whiteColor,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 40,
                            decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$30,000.00',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.blackColor,
                                      ),
                                    ),
                                    Text(
                                      'BTC Price',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$30,000.00',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.blackColor,
                                      ),
                                    ),
                                    Text(
                                      'BTC Price',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$30,000.00',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.blackColor,
                                      ),
                                    ),
                                    Text(
                                      'BTC Price',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.blackColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(20),
                            height: 180,
                            decoration: BoxDecoration(color: ColorResources.primaryColor, borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(color: ColorResources.whiteColor, borderRadius: BorderRadius.circular(5)),
                                      padding: EdgeInsets.all(2),
                                      child: Image.asset(
                                        "assets/image/CurrencyDollar.png",
                                        // color: ColorResources.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'USD',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: rubikLight.copyWith(
                                              fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.whiteColor, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Wallet',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: rubikLight.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_SMALL,
                                            color: ColorResources.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$ 3,753',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: rubikLight.copyWith(
                                              fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                                              color: ColorResources.whiteColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 3,
                                          ),
                                          child: Text(
                                            '.35',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: rubikLight.copyWith(
                                              fontSize: Dimensions.FONT_SIZE_SMALL,
                                              color: ColorResources.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '      USD',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                        color: ColorResources.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(20),
                            height: 180,
                            decoration: BoxDecoration(color: ColorResources.blackColor, borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(color: ColorResources.whiteColor, borderRadius: BorderRadius.circular(5)),
                                      padding: EdgeInsets.all(2),
                                      child: Image.asset(
                                        "assets/image/CurrencyBtc.png",
                                        // color: ColorResources.blackColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BTC',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: rubikLight.copyWith(
                                              fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.whiteColor, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Wallet',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: rubikLight.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_SMALL,
                                            color: ColorResources.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'BTC 0.00',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: rubikLight.copyWith(
                                              fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                                              color: ColorResources.whiteColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 3,
                                          ),
                                          child: Text(
                                            '.35',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: rubikLight.copyWith(
                                              fontSize: Dimensions.FONT_SIZE_SMALL,
                                              color: ColorResources.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '      Satoshis',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: rubikLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                        color: ColorResources.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          savingsItems(image: "deposit.png", label: "Deposit"),
                          savingsItems(image: "save_now.png", label: "Save Now"),
                          savingsItems(image: "loan.png", label: "Loan"),
                          savingsItems(image: "request.png", label: "Request"),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(color: ColorResources.primaryColor, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/image/verify_dentity_icon.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Investment Balance',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: rubikLight.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: ColorResources.whiteColor,
                                ),
                              ),
                              Text(
                                'Now  you can add unlimited card and account',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: rubikLight.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: ColorResources.whiteColor.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    requestCard(status: "Request"),
                    requestCard(status: "Pending Payment"),
                    // splashController.configModel.themeIndex == '1'
                    //     ? GetBuilder<ProfileController>(
                    //         builder: (profile) => FirstCardPortion(profileController: profile),
                    //       )
                    //     : splashController.configModel.themeIndex == '2'
                    //         ? SecondCardPortion()
                    //         : splashController.configModel.themeIndex == '3'
                    //             ? ThirdCardPortion()
                    //             : GetBuilder<ProfileController>(builder: (profile) => FirstCardPortion(profileController: profile)),
                    // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    // GetBuilder<WebsiteLinkController>(builder: (websiteLinkController) {
                    //   return websiteLinkController.isLoading
                    //       ? WebSiteShimmer()
                    //       : websiteLinkController.websiteList.length > 0
                    //           ? LinkedWebsite(websiteLinkController: websiteLinkController)
                    //           : SizedBox();
                    // }),

                    const SizedBox(height: 80),
                  ],
                );
              }),
            ),
          ),
          // persistentContentHeight: 70,
          // persistentHeader: CustomPersistentHeader(),
          // expandableContent: CustomExpandableContant()
        ),
      );
    });
  }

  Widget requestCard({String status}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(color: ColorResources.blackColor, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  status,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: rubikLight.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: ColorResources.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '9:29 PM | 21-June-2022',
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: rubikLight.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: ColorResources.greyColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Olakanmi Aina, ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorResources.blackColor,
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
                TextSpan(
                  text: '0123467253',
                  style: TextStyle(
                    color: ColorResources.greyColor,
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'GTBank - \$2,000.00, ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorResources.blackColor,
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'REF:, ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorResources.blackColor,
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      ),
                    ),
                    TextSpan(
                      text: '#4545635736474',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: ColorResources.greyColor,
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      ),
                    ),
                  ],
                ),
              ),
              if (status == "Request")
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(color: ColorResources.blackColor, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Accept',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: rubikLight.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        decoration: BoxDecoration(
                            color: ColorResources.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorResources.blackColor, width: 1)),
                        child: Text(
                          'Deny',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: rubikLight.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (status == "Pending Payment")
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(color: ColorResources.blackColor, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Paid',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: rubikLight.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget savingsItems({String image, String label}) {
    return Column(
      children: [
        Image.asset(
          "assets/image/" + image,
          height: 40,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: rubikLight.copyWith(
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: ColorResources.blackColor,
          ),
        ),
      ],
    );
  }
}
