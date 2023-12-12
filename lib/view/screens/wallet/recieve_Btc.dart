import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/controller/wallet_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/base/custom_text_field.dart';
import 'package:bittsave/view/base/text_widgets.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class ReceiveBtc extends StatefulWidget {
  const ReceiveBtc({Key key}) : super(key: key);

  @override
  State<ReceiveBtc> createState() => _ReceiveBtcState();
}

class _ReceiveBtcState extends State<ReceiveBtc> {
  bool isInitialLoad = false;
  bool isRequeryLoading = false;
  final TextEditingController amount = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: ColorResources.primaryColor,
        onPressed: () {
          paymentSheet();
        },
      ),
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 10),
                    child: Text('Trasaction History', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  transactionList(),
                ],
              ),
            ),
          ),
        ),
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
                    // children: [],
                    // {
                    //   id: 11,
                    //   amount: 100,
                    //   payment_method: btc,
                    //   status: waiting,
                    //   tran_id: Aj1671788318,
                    //   address: 3BMCBhErZo1SWxLxbzsTFeHDWHVu2pdJgq,
                    //   payment_id: 5696554785,
                    //   description: lateef_100_1671788318
                    // },
                    children: controller.btcCoinHistory.map((item) {
                      return Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)))),
                        child: ListTile(
                          onTap: () {
                            paymentInfoSheet(item, controller);
                          },
                          subtitle: Text(
                            item["address"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          title: Text(
                            item["payment_method"].toString().toUpperCase() + " " + item["amount"].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                          trailing: Text(
                            item["status"],
                            style: TextStyle(fontWeight: FontWeight.bold, color: statusColor(item["status"])),
                          ),
                        ),
                      );
                    }).toList(),
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

  Future<bool> loadSavings(WalletController controller) async {
    if (isInitialLoad == true) {
      return false;
    }

    return controller.getNOWPayments("btc");
  }

  Widget paymentSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.h),
          topRight: Radius.circular(40.h),
        ),
      ),
      builder: (context) {
        return Container(
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.h),
              topRight: Radius.circular(40.h),
            ),
          ),
          child: GetBuilder<WalletController>(
            builder: (controller) {
              return GetBuilder<SplashController>(builder: (splashController) {
                return StatefulBuilder(builder: (context, updateState) {
                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h),
                      ),
                    ),
                    child: Container(
                      height: 220,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'DEPOSIT BTC',
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      radius: 14,
                                      child: Icon(
                                        Icons.clear,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  regularText(
                                    "Amount",
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: ColorResources.greyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomTextField(
                                    hintText: "Amount",
                                    inputType: TextInputType.number,
                                    controller: amount,
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: buttonWithBorder(
                                      'Submit',
                                      textColor: Colors.white,
                                      buttonColor: ColorResources.primaryColor,
                                      fontSize: 18.sp,
                                      busy: controller.isLoading,
                                      fontWeight: FontWeight.w400,
                                      height: 54.h,
                                      onTap: () async {
                                        updateState(() {});
                                        await controller.createNOWPayment({
                                          "price_amount": amount.text,
                                          "pay_currency": "btc",
                                        });
                                        amount.text = "";
                                        setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
              });
            },
          ),
        );
      },
    );
  }

  Widget paymentInfoSheet(Map<String, dynamic> record, WalletController controller) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.h),
          topRight: Radius.circular(40.h),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, updateState) {
          return Container(
            height: 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.h),
                topRight: Radius.circular(40.h),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorResources.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.h),
                      topRight: Radius.circular(40.h),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Transaction Details',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 14,
                          child: Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        QrImage(
                          data: record["address"].toString(),
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                        ListTile(
                          title: Text(
                            "Receiver Address",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                          subtitle: Text(
                            record["address"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                FlutterClipboard.copy(record["address"].toString()).then((value) => print('copied'));
                              },
                              icon: Icon(Icons.copy)),
                        ),
                        ListTile(
                          subtitle: Text(
                            record["payment_method"].toString().toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          title: Text(
                            "Currency",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                        ),
                        ListTile(
                          subtitle: Text(
                            record["amount"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          title: Text(
                            "Amount",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                        ),
                        ListTile(
                          subtitle: Text(
                            record["tran_id"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          title: Text(
                            "Transaction ID",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                        ),
                        ListTile(
                          subtitle: Text(
                            record["payment_id"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          title: Text(
                            "Payment ID",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                        ),
                        ListTile(
                          subtitle: Text(
                            record["status"].toString().toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          title: Text(
                            "Status",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                          trailing: FloatingActionButton(
                            onPressed: () async {
                              if (isRequeryLoading) return;

                              updateState(() {
                                isRequeryLoading = true;
                              });
                              await controller.requeryNOWPayment({
                                "payment_id": record["payment_id"],
                              });
                              updateState(() {
                                isRequeryLoading = false;
                              });
                            },
                            child: (!isRequeryLoading)
                                ? Icon(
                                    Icons.refresh,
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                            backgroundColor: ColorResources.primaryColor,
                            mini: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Color statusColor(String status) {
    if (status == "finished") {
      return Colors.green;
    }

    if (status == "expire") {
      return Colors.red;
    }

    return Colors.yellow.shade900;
  }
}
