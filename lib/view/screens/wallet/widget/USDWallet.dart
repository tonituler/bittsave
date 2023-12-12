import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/localization_controller.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/wallet_controller.dart';
import 'package:bittsave/data/model/transaction_model.dart';
import 'package:bittsave/helper/date_converter.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/util/app_constants.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/util/styles.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';
import 'package:bittsave/view/screens/wallet/recieve_usd.dart';
import 'package:bittsave/view/screens/wallet/send_usd.dart';
import 'package:bittsave/view/screens/wallet/widget/BTCWallet.dart';
import 'package:bittsave/view/screens/wallet/widget/WithDraw.dart';

import '../../home/widget/bottom_sheet/expandable_contant.dart';
import '../../home/widget/bottom_sheet/persistent_header.dart';

class USDWalletScreen extends StatefulWidget {
  const USDWalletScreen({Key key}) : super(key: key);

  @override
  State<USDWalletScreen> createState() => _USDWalletScreenState();
}

class _USDWalletScreenState extends State<USDWalletScreen> {
  bool isInitialLoad = false;

  @override
  Widget build(BuildContext context) {
    return ExpandableBottomSheet(
      enableToggle: true,
      persistentContentHeight: 200,
      background: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 20,
            right: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 20, left: 8),
                child: BoldTextTitle(
                  data: 'USD Wallet',
                ),
              ),
              // SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 25),
                child: Text(
                  'Swipe left to view your BTC wallet.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 5, bottom: 10),
                child: PhysicalModel(
                  elevation: 8,
                  color: Colors.pink,
                  shadowColor: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                  child: GetBuilder<ProfileController>(builder: (profileController) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'USD',
                                style: TextStyle(color: Colors.white, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
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
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              '\$${PriceConverter.priceFormater(balance: profileController.userInfo.usdBalance)}',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WalletIcons(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SendUsd();
                            },
                          ),
                        );
                      },
                      icon: "CaretCircleUp.png",
                      label: "Send",
                    ),
                    WalletIcons(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WithDrawPaymentOptions(),
                          ),
                        );
                      },
                      icon: "Compass.png",
                      label: "Withdraw",
                    ),
                    WalletIcons(
                      ontap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return FundingUsdWallet();
                        }));
                      },
                      icon: "StopCircle.png",
                      label: "Deposit",
                    ),
                    WalletIcons(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReceiveUsd(),
                          ),
                        );
                      },
                      icon: "PlayCircle.png",
                      label: "Receive",
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Divider(
                  color: ColorResources.primaryColor,
                  height: 2,
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: 280,
              ),
            ],
          ),
        ),
      ),
      persistentHeader: CustomPersistentHeader(),
      expandableContent: CustomExpandableContant(),
    );
  }

  Widget transactions() {
    return GetBuilder<WalletController>(
      builder: (controller) {
        return FutureBuilder(
          future: loadSavings(controller),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              isInitialLoad = true;
              return Container(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              isInitialLoad = true;
              return Container();
            } else if (snapshot.hasData) {
              isInitialLoad = true;

              print(controller.usdHistory.length);

              if (controller.usdHistory.isEmpty) {
                return Container();
              } else {
                return Column(
                  children: controller.usdHistory.map((item) => transactionItem(item)).toList(),
                );
              }
            } else {
              isInitialLoad = true;
              return Container(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget transactionItem(Transactions transactions) {
    String _userPhone = transactions.transactionType == AppConstants.SEND_MONEY
        ? transactions.receiver.phone
        : transactions.transactionType == AppConstants.RECEIVED_MONEY
            ? transactions.sender.phone
            : transactions.transactionType == AppConstants.ADD_MONEY
                ? transactions.sender.phone
                : transactions.transactionType == AppConstants.CASH_IN
                    ? transactions.sender.phone
                    : transactions.userInfo.phone;
    String _userName = transactions.transactionType == AppConstants.SEND_MONEY
        ? transactions.receiver.name
        : transactions.transactionType == AppConstants.RECEIVED_MONEY
            ? transactions.sender.name
            : transactions.transactionType == AppConstants.ADD_MONEY
                ? transactions.sender.name
                : transactions.transactionType == AppConstants.CASH_IN
                    ? transactions.sender.name
                    : transactions.userInfo.name;

    String _imageLogo = transactions.transactionType == AppConstants.SEND_MONEY
        ? Images.send_money_image
        : transactions.transactionType == AppConstants.RECEIVED_MONEY
            ? Images.requestMoney_logo
            : transactions.transactionType == AppConstants.ADD_MONEY
                ? Images.addMoneyLogo3
                : transactions.transactionType == AppConstants.CASH_OUT
                    ? Images.cashOut_logo
                    : Images.send_money_image;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(height: 50, width: 50, child: Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(_imageLogo))),
                  SizedBox(
                    width: 5,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                        transactions.transactionType == 'send_money'
                            ? 'send_money'.tr
                            : transactions.transactionType == 'cash_out'
                                ? 'cash_out'.tr
                                : transactions.transactionType == 'cash_in'
                                    ? 'cash_in'.tr
                                    : transactions.transactionType == 'received_money'
                                        ? 'received_money'.tr
                                        : 'add_money'.tr,
                        style: montserratMedium.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                    SizedBox(height: Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL),
                    Text(
                      _userName ?? '',
                      style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL),

                    Text(_userPhone ?? '', style: montserratMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                    SizedBox(height: Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL),

                    Text('TrxID: ${transactions.transactionId}', style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL))
                    // Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(transactions.createdAt)),style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.getHintColor()),),
                  ]),
                  Spacer(),
                  Text(
                      transactions.transactionType == 'send_money' || transactions.transactionType == 'cash_out'
                          ? '- ${PriceConverter.convertPrice(context, double.parse(transactions.amount.toString()))}'
                          : '+ ${PriceConverter.convertPrice(context, double.parse(transactions.amount.toString()))}',
                      style: montserratMedium.copyWith(
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: transactions.transactionType == 'send_money' || transactions.transactionType == 'cash_out'
                              ? Colors.redAccent
                              : Colors.green)),
                ],
              ),
              SizedBox(height: 5),
              Divider(height: .125, color: ColorResources.getGreyColor()),
            ],
          ),
          Get.find<LocalizationController>().isLtr
              ? Positioned(
                  bottom: 3,
                  right: 2,
                  child: Text(
                    DateConverter.localDateToIsoStringAMPM(DateTime.parse(transactions.createdAt)),
                    style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.getHintColor()),
                  ),
                )
              : Positioned(
                  bottom: 3,
                  left: 2,
                  child: Text(
                    DateConverter.localDateToIsoStringAMPM(DateTime.parse(transactions.createdAt)),
                    style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.getHintColor()),
                  ),
                )
        ],
      ),
    );
  }

  String formatedDate(String date) {
    DateTime dT = DateTime.parse(date);

    return DateFormat('hh:mm a').format(DateTime(0, dT.month, dT.day, dT.hour, dT.minute)) +
        " | " "${dT.day}-" +
        DateFormat('MMMM').format(DateTime(0, dT.month)) +
        "-" +
        dT.year.toString();
  }

  Future<bool> loadSavings(WalletController controller) async {
    if (isInitialLoad == true) {
      return false;
    }

    return controller.getUSDHistory();
  }
}
