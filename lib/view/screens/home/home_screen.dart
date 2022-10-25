import 'dart:math';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/app/size_config/config.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/banner_controller.dart';
import 'package:six_cash/controller/home_controller.dart';
import 'package:six_cash/controller/notification_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/requested_money_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/controller/transaction_controller.dart';
import 'package:six_cash/controller/transaction_history_controller.dart';
import 'package:six_cash/controller/websitelink_controller.dart';
import 'package:six_cash/data/model/response/requested_money_model.dart';
import 'package:six_cash/data/model/transaction_model.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/loan/loan_page.dart';
import 'package:six_cash/view/screens/home/savings_pages/myPlans.dart';
import 'package:six_cash/view/screens/home/widget/app_bar.dart';
import 'package:six_cash/view/screens/home/widget/first_card_portion.dart';
import 'package:six_cash/view/screens/home/widget/linked_website_portion.dart';
import 'package:six_cash/view/screens/home/widget/secend_card_portion.dart';
import 'package:six_cash/view/screens/home/widget/shimmer/banner_shimmer.dart';
import 'package:six_cash/view/screens/home/widget/shimmer/home_screen_shimmer.dart';
import 'package:six_cash/view/screens/home/widget/shimmer/web_site_shimmer.dart';
import 'package:six_cash/view/screens/home/widget/third_card_portion.dart';
import 'package:six_cash/view/screens/settings_page/KYC.dart';

import '../../../helper/route_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirst = true;
  final _pinCodeFieldController = TextEditingController();
  Future<void> _loadData(BuildContext context, bool reload) async {
    await Get.find<ProfileController>().profileData(loading: true).then((value) {
      if (value.isOk) {
        // Get.find<BannerController>().getBannerList(reload);
        Get.find<RequestedMoneyController>().getDashboardRequestedMoneyList(1, context, reload: reload);
        Get.find<RequestedMoneyController>().getRequestedMoneyList(1, context, reload: reload);
        Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(1, reload: reload);
        Get.find<TransactionHistoryController>().getDepositRequest(reload: reload);
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
    SizeConfig.init(context);
    return BackGroundColr(
      child: GetBuilder<HomeController>(builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarBase(),
          body: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: ExpandableBottomSheet(
              enableToggle: true,
              background: RefreshIndicator(
                onRefresh: () async {
                  await _loadData(context, true);
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: GetBuilder<SplashController>(builder: (splashController) {
                    return GetBuilder<ProfileController>(builder: (profileController) {
                      return Column(
                        children: [
                          if (profileController.userInfo != null)
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                              padding: EdgeInsets.all(20),
                              width: double.infinity,
                              height: 210,
                              decoration: BoxDecoration(
                                color: ColorResources.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Investment Balance',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: montserratLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.whiteColor, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$${PriceConverter.priceFormater(balance: profileController.userInfo.investedBalanceUSD)}',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: montserratLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, color: ColorResources.whiteColor, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${PriceConverter.priceFormater(balance: profileController.userInfo.investedBalanceBTC)} BTC',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: montserratLight.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_LARGE - 2, color: ColorResources.whiteColor, fontWeight: FontWeight.w500),
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
                                              '\$${PriceConverter.priceFormater(balance: double.parse(splashController.configModel.btcValue))}',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: montserratLight.copyWith(
                                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                                color: ColorResources.blackColor,
                                              ),
                                            ),
                                            Text(
                                              'BTC Price',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: montserratLight.copyWith(
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
                                              '\$${PriceConverter.priceFormater(balance: profileController.userInfo.invested)}',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: montserratLight.copyWith(
                                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                                color: ColorResources.blackColor,
                                              ),
                                            ),
                                            Text(
                                              'Invested',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: montserratLight.copyWith(
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
                                              '\$${PriceConverter.priceFormater(balance: profileController.userInfo.returns)}',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: montserratLight.copyWith(
                                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                                color: ColorResources.blackColor,
                                              ),
                                            ),
                                            Text(
                                              'Returns',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: montserratLight.copyWith(
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
                          if (profileController.userInfo == null)
                            Container(
                              height: 420,
                              width: MediaQuery.of(context).size.width,
                              child: HomeScreenShimmer(),
                            ),

                          if (profileController.userInfo != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
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
                                                height: 30,
                                                width: 30,
                                                padding: EdgeInsets.all(0),
                                                child: Image.asset(
                                                  "assets/image/dollar_coin.png",
                                                  height: 30,
                                                  width: 30,
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
                                                    style: montserratLight.copyWith(
                                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                                        color: ColorResources.whiteColor,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Wallet',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: montserratLight.copyWith(
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
                                                    '\$ ${PriceConverter.priceFormatInt(balance: profileController.userInfo.usdBalance.toInt())}',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: montserratLight.copyWith(
                                                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE - 1,
                                                      color: ColorResources.whiteColor,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      bottom: 3,
                                                    ),
                                                    child: Text(
                                                      '.' + ((profileController.userInfo.usdBalance % 1) * pow(10, 2)).round().toString(),
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: montserratLight.copyWith(
                                                        fontSize: Dimensions.FONT_SIZE_SMALL + 2,
                                                        color: ColorResources.whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                                                  'USD',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: montserratLight.copyWith(
                                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                    color: ColorResources.whiteColor,
                                                  ),
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
                                      margin: EdgeInsets.only(left: 5, right: 5),
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
                                                height: 30,
                                                width: 30,
                                                padding: EdgeInsets.all(0),
                                                child: Image.asset(
                                                  "assets/image/btc_coin.png",
                                                  height: 30,
                                                  width: 30,
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
                                                    style: montserratLight.copyWith(
                                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                                        color: ColorResources.whiteColor,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Wallet',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: montserratLight.copyWith(
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
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '\$ ${PriceConverter.priceFormatInt(balance: profileController.userInfo.btcBalanceInUSD.toInt())}',
                                                        textAlign: TextAlign.start,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: montserratLight.copyWith(
                                                          fontSize: Dimensions.FONT_SIZE_OVER_LARGE - 1,
                                                          color: ColorResources.whiteColor,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                          bottom: 3,
                                                        ),
                                                        child: Text(
                                                          '.' + ((profileController.userInfo.btcBalanceInUSD % 1) * pow(10, 2)).round().toString(),
                                                          textAlign: TextAlign.start,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: montserratLight.copyWith(
                                                            fontSize: Dimensions.FONT_SIZE_SMALL + 2,
                                                            color: ColorResources.whiteColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                                                  'USD',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: montserratLight.copyWith(
                                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                    color: ColorResources.whiteColor,
                                                  ),
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
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return FundingUsdWallet();
                                    }));
                                  },
                                  child: savingsItems(
                                    image: "credit_card_red.png",
                                    label: "Deposit",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyPlans(),
                                      ),
                                    );
                                  },
                                  child: savingsItems(
                                    image: "open_folder_add.png",
                                    label: "Save Now",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return LoanApplication();
                                    }));
                                  },
                                  child: savingsItems(
                                    image: "grid_04.png",
                                    label: "Loan",
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed(RouteHelper.getRequestedMoneyRoute()),
                                  child: savingsItems(
                                    image: "grid_03.png",
                                    label: "Request",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (profileController.userInfo != null && profileController.userInfo.isKycVerified != 2)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KYC(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(color: ColorResources.primaryColor, borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/image/verify_dentity_icon.png",
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Verify your Identity',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: montserratLight.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                            color: ColorResources.whiteColor,
                                          ),
                                        ),
                                        Text(
                                          'We need to know you, so you can access all \nour features and help us keep your account safe',
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: montserratLight.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_SMALL,
                                            color: ColorResources.whiteColor.withOpacity(0.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          GetBuilder<RequestedMoneyController>(builder: (requestedMoneyController) {
                            if (requestedMoneyController.isLoadingDashboardRequestedMoney) {
                              return BannerShimmer();
                            }

                            return Column(
                              children: [
                                ...requestedMoneyController.pendingDashboardRequestedMoneyList.map((item) {
                                  return requestMoneyCard(item);
                                }).toList(),
                              ],
                            );
                          }),

                          GetBuilder<TransactionHistoryController>(builder: (transactionHistoryController) {
                            if (transactionHistoryController.isLoadingUnpaidDeposit) {
                              return BannerShimmer();
                            }

                            if (transactionHistoryController.unpaidDeposit != null) {
                              return requestCard(transactionHistoryController.unpaidDeposit);
                            }

                            return SizedBox();
                          }),

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
                    });
                  }),
                ),
              ),
              // persistentContentHeight: 70,
              // persistentHeader: CustomPersistentHeader(),
              // expandableContent: CustomExpandableContant()
            ),
          ),
        );
      }),
    );
  }

  Widget requestMoneyCard(RequestedMoney request) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.08), borderRadius: BorderRadius.circular(10)),
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
                  "Request",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: montserratLight.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: ColorResources.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                formatedHistoryDate(request.createdAt),
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: montserratLight.copyWith(
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
                  text: '${request.sender.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ColorResources.blackColor,
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
                // TextSpan(
                //   text: '@olaoni2202',
                //   style: TextStyle(
                //     color: ColorResources.greyColor,
                //     fontSize: Dimensions.FONT_SIZE_DEFAULT,
                //   ),
                // ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Amount - \$${request.amount}, ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
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
                      text: 'NOTE :  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorResources.blackColor,
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      ),
                    ),
                    if (request.note != null)
                      TextSpan(
                        text: request.note,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ColorResources.greyColor,
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showPinBottomSheet("approve", request.id);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(color: ColorResources.blackColor, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Accept',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: montserratLight.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showPinBottomSheet("deny", request.id);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        decoration: BoxDecoration(
                          color: ColorResources.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorResources.blackColor.withOpacity(0.1), width: 1),
                        ),
                        child: Text(
                          'Deny',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: montserratLight.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showConfirmUpdateRequestBottomSheet("later", request.id);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        decoration: BoxDecoration(
                          color: ColorResources.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorResources.blackColor.withOpacity(0.1), width: 1),
                        ),
                        child: Text(
                          'Later',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: montserratLight.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.blackColor,
                          ),
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

  String formatedHistoryDate(String date) {
    DateTime dT = DateTime.parse(date);

    return DateFormat('hh:mm a').format(DateTime(0, dT.month, dT.day, dT.hour, dT.minute)) +
        " | " "${dT.day}-" +
        DateFormat('MMMM').format(DateTime(0, dT.month)) +
        "-" +
        dT.year.toString();
  }

  showPinBottomSheet(String slug, int id) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context,
        isDismissible: true,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.RADIUS_SIZE_LARGE),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, updateState) {
            return Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Text(
                        'Enter your transaction PIN',
                        style: montserratMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(27.0), color: ColorResources.getGreyBaseGray6()),
                      child: TextField(
                        controller: _pinCodeFieldController,
                        obscureText: true,
                        maxLength: 4,
                        textAlign: TextAlign.center,
                        // hintCharacter: '•',
                        onChanged: (value) {
                          updateState(() {});
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                        decoration: InputDecoration(
                          hintText: 'PIN',
                          hintStyle: TextStyle(
                            color: Colors.pink,
                            fontSize: 18,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    GetBuilder<RequestedMoneyController>(builder: (requestedMoneyController) {
                      return Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 35.w,
                        ),
                        child: buttonWithBorder(
                          'Submit',
                          textColor: Colors.white,
                          buttonColor: ColorResources.primaryColor,
                          fontSize: 18.sp,
                          busy: requestedMoneyController.isLoadingUpdateRequestedMoney,
                          fontWeight: FontWeight.w400,
                          height: 54.h,
                          onTap: () async {
                            await requestedMoneyController.updateRequest(context, slug, id, _pinCodeFieldController.text);
                            _pinCodeFieldController.text = "";
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          });
        });
  }

  showConfirmUpdateRequestBottomSheet(String slug, int id) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context,
        isDismissible: true,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.RADIUS_SIZE_LARGE),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, updateState) {
            return Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Text(
                        'Are you sure you want to differ this request',
                        textAlign: TextAlign.center,
                        style: montserratMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE + 5),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GetBuilder<RequestedMoneyController>(builder: (requestedMoneyController) {
                          return Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 35.w,
                            ),
                            child: buttonWithBorder(
                              'Yes',
                              textColor: Colors.white,
                              buttonColor: ColorResources.primaryColor,
                              fontSize: 18.sp,
                              busy: requestedMoneyController.isLoadingUpdateRequestedMoney,
                              fontWeight: FontWeight.w400,
                              height: 54.h,
                              onTap: () async {
                                await requestedMoneyController.updateRequest(context, slug, id, "");
                              },
                            ),
                          );
                        }),
                        GetBuilder<RequestedMoneyController>(builder: (requestedMoneyController) {
                          return Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 35.w,
                            ),
                            child: buttonWithBorder(
                              'No',
                              textColor: ColorResources.primaryColor,
                              buttonColor: ColorResources.whiteColor,
                              borderColor: ColorResources.primaryColor,
                              borderRadius: 10,
                              fontSize: 18.sp,
                              busy: false,
                              diabled: requestedMoneyController.isLoadingUpdateRequestedMoney,
                              fontWeight: FontWeight.w400,
                              height: 54.h,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  showConfirmBottomSheet(int id) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context,
        isDismissible: true,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.RADIUS_SIZE_LARGE),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, updateState) {
            return Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Text(
                        'Are you sure you want to confirm payment?',
                        textAlign: TextAlign.center,
                        style: montserratMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE + 2),
                      ),
                    ),
                    SizedBox(height: 10),
                    GetBuilder<TransactionHistoryController>(builder: (requestedMoneyController) {
                      return Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 35.w,
                        ),
                        child: buttonWithBorder(
                          'Confirm',
                          textColor: Colors.white,
                          buttonColor: ColorResources.primaryColor,
                          fontSize: 18.sp,
                          busy: requestedMoneyController.isLoadingUpdateUnpaidDeposit,
                          fontWeight: FontWeight.w400,
                          height: 54.h,
                          onTap: () async {
                            await requestedMoneyController.confirmDepositRequest(context, id);
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          });
        });
  }

  Widget requestCard(UnpaidDeposit deposit) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.08), borderRadius: BorderRadius.circular(10)),
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
                  "Pending payment",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: montserratLight.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: ColorResources.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                formatedHistoryDate(deposit.dateCreated),
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: montserratLight.copyWith(
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
                  text: '${deposit.accountName}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ColorResources.blackColor,
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
                  text: 'Bank - ${deposit.bankName}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
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
                      text: 'Amount - ₦${deposit.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorResources.blackColor,
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showConfirmBottomSheet(int.parse(deposit.id));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(color: ColorResources.blackColor, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Paid',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: montserratLight.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.whiteColor,
                          ),
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
          style: montserratLight.copyWith(
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: ColorResources.blackColor,
          ),
        ),
      ],
    );
  }
}
