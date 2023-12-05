import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/localization_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/wallet_controller.dart';
import 'package:six_cash/data/model/transaction_model.dart';
import 'package:six_cash/helper/date_converter.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/app_constants.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/ecpandable_bottom_sheet.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/expandable_contant.dart';
import 'package:six_cash/view/screens/wallet/buy_btc.dart';
import 'package:six_cash/view/screens/wallet/recieve_Btc.dart';
import 'package:six_cash/view/screens/wallet/sell_btc.dart';

import '../../home/widget/bottom_sheet/persistent_header.dart';
import '../send_btc.dart';

class BTCWalletScreen extends StatefulWidget {
  const BTCWalletScreen({Key key}) : super(key: key);

  @override
  State<BTCWalletScreen> createState() => _BTCWalletScreenState();
}

class _BTCWalletScreenState extends State<BTCWalletScreen> {
  bool isInitialLoad = false;
  @override
  Widget build(BuildContext context) {
    return ExpandableBottomSheet(
      enableToggle: true,
      persistentContentHeight: 200,
      background: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 20, left: 8),
                child: BoldTextTitle(
                  data: 'BTC Wallet',
                ),
              ),
              // SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 25),
                child: Text(
                  'Swipe right to view your USD wallet.',
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
                                'BTC',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  "assets/image/btc.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Text(
                              '${profileController.userInfo.btcBalance}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$${PriceConverter.priceFormater(balance: PriceConverter.converBTCToDolar(profileController.userInfo.btcBalance))}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                ),
                              ),
                              // Expanded(
                              //   child: Text(
                              //     ' ${PriceConverter.priceFormater(balance: profileController.userInfo.btcInSatoshis)} sats',
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w200,
                              //         fontSize: Dimensions.FONT_SIZE_LARGE),
                              //   ),
                              // )
                            ],
                          ),
                          // Text(
                          //   '\$${PriceConverter.priceFormater(balance: PriceConverter.converBTCToDolar(profileController.userInfo.btcBalance))} | ${profileController.userInfo.btcInSatoshis} sats',
                          //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: Dimensions.FONT_SIZE_LARGE),
                          // )
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
                            builder: (context) => SellBtc(),
                          ),
                        );
                      },
                      icon: "Compass.png",
                      label: "Sell",
                    ),
                    WalletIcons(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyBTC(),
                          ),
                        );
                      },
                      icon: "StopCircle.png",
                      label: "Buy",
                    ),
                    WalletIcons(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SendBTC(),
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
                            builder: (context) => ReceiveBtc(),
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
              // Text(
              //   'Recent Transactions',
              //   textAlign: TextAlign.left,
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontWeight: FontWeight.w300,
              //     fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE - 2,
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
      persistentHeader: CustomPersistentHeader(),
      expandableContent: CustomExpandableBottomSheet(
        title: 'Recent Transactions',
        child: transactionList(),
      ),
    );
  }

  Widget transactionList() {
    return GetBuilder<WalletController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
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

                if (controller.btcHistory.isEmpty) {
                  return Container();
                } else {
                  return Column(
                    children: controller.btcHistory.map((item) => transactionItem(item)).toList(),
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
          ),
        );
      },
    );
  }

  Widget transactionItem(Transactions transactions){
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

    return controller.getBTCHistory();
  }
}

class WalletIcons extends StatelessWidget {
  final Function ontap;
  final String icon;
  final String label;
  const WalletIcons({this.ontap, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      "assets/image/" + icon,
                      color: ColorResources.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              label ?? "",
              style: TextStyle(
                color: ColorResources.blackColor,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.FONT_SIZE_SMALL + 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
