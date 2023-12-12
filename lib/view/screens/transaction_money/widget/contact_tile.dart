import 'package:bittsave/controller/transaction_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/styles.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final TransactionMoneyController transactionMoneyController;
  final int index;
  const ContactTile({Key key, @required this.transactionMoneyController, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            child: transactionMoneyController.filterdContacts[index].contact.thumbnail != null
                ? CircleAvatar(backgroundImage: MemoryImage(transactionMoneyController.filterdContacts[index].contact.thumbnail))
                : transactionMoneyController.filterdContacts[index].contact.displayName == ''
                    ? CircleAvatar()
                    : CircleAvatar(child: Text(transactionMoneyController.filterdContacts[index].contact.displayName[0].toUpperCase())),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionMoneyController.filterdContacts[index].contact.displayName,
                style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
              ),
              transactionMoneyController.filterdContacts[index].contact.phones.length <= 0
                  ? SizedBox()
                  : Text(
                      transactionMoneyController.filterdContacts[index].contact.phones.first.number,
                      style: montserratLight.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.getGreyBaseGray1()),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
