import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/controller/requested_money_controller.dart';
import 'package:six_cash/data/model/response/requested_money_model.dart';
import 'package:six_cash/helper/date_converter.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/util/app_constants.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/animated_custom_dialog.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/base/custom_ink_well.dart';

import 'confirmation_dialog.dart';

class RequestedMoneyCardWidget extends StatefulWidget {
  final RequestedMoney requestedMoney;
  final bool isHome;
  final bool isOwn;
  const RequestedMoneyCardWidget({Key key, this.requestedMoney, this.isHome, this.isOwn}) : super(key: key);

  @override
  State<RequestedMoneyCardWidget> createState() => _RequestedMoneyCardWidgetState();
}

class _RequestedMoneyCardWidgetState extends State<RequestedMoneyCardWidget> {
  final TextEditingController reqPasswordController = TextEditingController();
  final _pinCodeFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('own req : ====> ${widget.requestedMoney.receiver.name}');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${widget.isOwn ? widget.requestedMoney.receiver.name : widget.requestedMoney.sender.name}',
                    style: montserratMedium.copyWith(color: ColorResources.getTextColor(), fontSize: Dimensions.FONT_SIZE_LARGE)),
                SizedBox(height: Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL),
                Text('${widget.isOwn ? widget.requestedMoney.receiver.phone : widget.requestedMoney.sender.phone}',
                    style: montserratMedium.copyWith(color: ColorResources.getTextColor(), fontSize: Dimensions.FONT_SIZE_SMALL)),
                SizedBox(height: Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL),
                Text('amount'.tr + PriceConverter.balanceWithSymbol(balance: widget.requestedMoney.amount.toString()),
                    style: montserratMedium.copyWith(color: ColorResources.getPrimaryTextColor(), fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(widget.requestedMoney.createdAt)),
                    style: montserratLight.copyWith(color: ColorResources.getTextColor(), fontSize: Dimensions.FONT_SIZE_SMALL)),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Row(
                  children: [
                    Text('note'.tr, style: montserratSemiBold.copyWith(color: ColorResources.getTextColor(), fontSize: Dimensions.FONT_SIZE_LARGE)),
                    Text(widget.requestedMoney.note ?? 'no_note_available'.tr,
                        maxLines: widget.isHome ? 1 : 10,
                        overflow: TextOverflow.ellipsis,
                        style: montserratLight.copyWith(color: ColorResources.getHintColor(), fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  ],
                ),
              ]),
              Spacer(),
              widget.requestedMoney.type == AppConstants.PENDING && !widget.isOwn
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_LARGE)),
                              color: ColorResources.primaryColor),
                          child: CustomInkWell(
                              onTap: () {
                                showPinBottomSheet("approve", widget.requestedMoney.id);
                                // showAnimatedDialog(
                                //   context,
                                //   ConfirmationDialog(
                                //       passController: reqPasswordController,
                                //       icon: Images.success_icon,
                                //       isAccept: true,
                                //       description:
                                //           '${'are_you_sure_want_to_accept'.tr} \n ${widget.requestedMoney.sender.name} \n ${widget.requestedMoney.sender.phone}',
                                //       onYesPressed: () {
                                //         Get.find<RequestedMoneyController>()
                                //             .acceptRequest(context, widget.requestedMoney.id, reqPasswordController.text.trim())
                                //             .then((value) => Get.find<RequestedMoneyController>().getRequestedMoneyList(1, context));
                                //       }),
                                //   dismissible: false,
                                //   isFlip: true,
                                // );
                              },
                              radius: Dimensions.RADIUS_SIZE_EXTRA_LARGE,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Text(
                                  'accept'.tr,
                                  style: TextStyle(color: ColorResources.whiteColor),
                                ),
                              )),
                        ),
                        SizedBox(width: 4),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_LARGE)),
                              border: Border.all(width: 1, color: ColorResources.getRedColor())),
                          child: CustomInkWell(
                            onTap: () {
                              showPinBottomSheet("deny", widget.requestedMoney.id);
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return ConfirmationDialog(
                              //           icon: Images.failed_icon,
                              //           passController: reqPasswordController,
                              //           description:
                              //               '${'are_you_sure_want_to_denied'.tr} \n ${widget.requestedMoney.sender.name} \n ${widget.requestedMoney.sender.phone}',
                              //           onYesPressed: () {
                              //             Get.find<RequestedMoneyController>().isLoading
                              //                 ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))
                              //                 : Get.find<RequestedMoneyController>()
                              //                     .denyRequest(context, widget.requestedMoney.id, reqPasswordController.text.trim());
                              //           });
                              //     });
                              // Get.find<RequestedMoneyController>().getRequestedMoneyList(1, context);
                            },
                            radius: Dimensions.RADIUS_SIZE_EXTRA_LARGE,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                              child: Text('deny'.tr, style: TextStyle(color: ColorResources.getRedColor())),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      widget.requestedMoney.type,
                      style: montserratRegular.copyWith(color: ColorResources.primaryColor),
                    )
            ],
          ),
          SizedBox(height: 5),
          widget.isHome ? SizedBox() : Divider(height: .5, color: ColorResources.getGreyColor()),
        ],
      ),
    );
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
                            await requestedMoneyController.updateRequest(
                              context,
                              slug,
                              id,
                              _pinCodeFieldController.text,
                              callback: () async{
                                await Get.find<RequestedMoneyController>().getRequestedMoneyList(1, context);
                              },
                            );
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
}
