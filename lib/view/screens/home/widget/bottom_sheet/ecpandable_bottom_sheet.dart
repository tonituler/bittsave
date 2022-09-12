import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/screens/history/widget/history_view.dart';

class CustomExpandableBottomSheet extends StatefulWidget {
  CustomExpandableBottomSheet({Key key, this.title, this.child}) : super(key: key);
  Widget child;
  String title;

  @override
  State<CustomExpandableBottomSheet> createState() => _CustomExpandableBottomSheetState();
}

class _CustomExpandableBottomSheetState extends State<CustomExpandableBottomSheet> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Text(
                widget.title,
                style: montserratMedium.copyWith(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: ColorResources.getPrimaryTextColor(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: ColorResources.getBackgroundColor(),
              child: SingleChildScrollView(child: widget.child),
              // child: SingleChildScrollView(child: TransactionViewScreen(scrollController: scrollController, isHome: true)),
            ),
          ),
        ],
      ),
    );
  }
}
