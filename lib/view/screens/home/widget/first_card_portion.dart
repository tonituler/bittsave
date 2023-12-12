import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/util/styles.dart';
import 'package:bittsave/view/base/custom_ink_well.dart';
import 'package:bittsave/view/new_screens/tab_controller.dart';
import 'package:bittsave/view/screens/home/widget/banner_view.dart';
import 'package:bittsave/view/screens/home/widget/custom_card.dart';
import 'package:bittsave/view/screens/transaction_money/transaction_money_screen.dart';
import 'package:bittsave/view/screens/transaction_money/widget/transaction_money_balance_input.dart';

class FirstCardPortion extends StatelessWidget {
  final ProfileController profileController;
  const FirstCardPortion({Key key, @required this.profileController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return SizedBox(
      child: Stack(
        children: [
          Container(
            height: Dimensions.MAIN_BACKGROUND_CARD_WEIGHT,
            // color: ColorResources.getPrimaryColor(),
          ),
          Positioned(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: Dimensions.ADD_MONEY_CARD,
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_LARGE),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_LARGE),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'your_balance'.tr,
                              style: montserratLight.copyWith(
                                color: ColorResources.getBalanceTextColor(),
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            ),
                            profileController.userInfo != null
                                ? Text(
                                    PriceConverter.balanceWithSymbol(balance: profileController.userInfo.balance.toString()),
                                    style: montserratMedium.copyWith(
                                      color: ColorResources.getPrimaryTextColor(),
                                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                                    ),
                                  )
                                : Text(PriceConverter.convertPrice(context, 0.00),
                                    style: montserratMedium.copyWith(
                                      color: ColorResources.getPrimaryTextColor(),
                                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                                    )),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: Dimensions.ADD_MONEY_CARD,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_LARGE),
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        child: CustomInkWell(
                          onTap: () => Get.to(TransactionMoneyBalanceInput(transactionType: 'add_money')),
                          radius: Dimensions.RADIUS_SIZE_LARGE,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 34, child: Image.asset(Images.wolet_logo)),
                                SizedBox(
                                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                ),
                                Text(
                                  'add_money'.tr,
                                  style: montserratRegular.copyWith(
                                      fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Theme.of(context).textTheme.bodyText1.color),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Cards...
                SizedBox(
                  height: Dimensions.TRANSACTION_TYPE_CARD_HEIGHT,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.FONT_SIZE_EXTRA_SMALL),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const TabContrller();
                                  }));
                                },
                                child: CustomCard(
                                  image: Images.sendMoney_logo,
                                  text: 'send_money_'.tr,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  // onTap: () => Get.to(() =>
                                  //     TransactionMoneyScreen(
                                  //         fromEdit: false,
                                ))),
                        Expanded(
                            child: CustomCard(
                                image: Images.cashOut_logo,
                                text: 'cash_out_'.tr,
                                color: ColorResources.getCashOutCardColor(),
                                onTap: () => Get.to(() => TransactionMoneyScreen(fromEdit: false, transactionType: 'cash_out')))),
                        Expanded(
                            child: CustomCard(
                                image: Images.requestMoneyLogo,
                                text: 'request_money'.tr,
                                color: ColorResources.getRequestMoneyCardColor(),
                                onTap: () => Get.to(() => TransactionMoneyScreen(fromEdit: false, transactionType: 'request_money')))),
                        Expanded(
                          child: CustomCard(
                              image: Images.request_list_image2,
                              text: 'requests'.tr,
                              color: ColorResources.getReferFriendCardColor(),
                              onTap: () => Get.toNamed(RouteHelper.getRequestedMoneyRoute(from: 'other'))),
                        ),
                      ],
                    ),
                  ),
                ),

                BannerView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
