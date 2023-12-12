import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/requested_money_controller.dart';
import 'package:bittsave/data/model/response/requested_money_model.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/styles.dart';
import 'package:bittsave/view/base/custom_app_bar.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/requested_money/widget/requested_money_screen.dart';

class RequestedMoneyListScreen extends StatefulWidget {
  final bool isOwn;

  RequestedMoneyListScreen({Key key, @required this.isOwn}) : super(key: key);

  @override
  State<RequestedMoneyListScreen> createState() => _RequestedMoneyListScreenState();
}

class _RequestedMoneyListScreenState extends State<RequestedMoneyListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.isOwn) {
        Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(1, reload: true);
      } else {
        Get.find<RequestedMoneyController>().getRequestedMoneyList(1, context, reload: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("own is ${widget.isOwn}");
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: CustomAppbar(
        //     title: widget.isOwn ? 'send_requests'.tr : 'requests'.tr,
        //     onTap: () {
        //       Get.back();
        //     }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10, top: 20), child: BackButtons()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.isOwn ? 'send_requests'.tr : 'requests'.tr,
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: RefreshIndicator(
                backgroundColor: Colors.transparent,
                onRefresh: () async {
                  if (widget.isOwn) {
                    await Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(1, reload: true);
                  } else {
                    await Get.find<RequestedMoneyController>().getRequestedMoneyList(1, context, reload: true);
                  }

                  return true;
                },
                child: CustomScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  slivers: [
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverDelegate(
                            child: Container(
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: GetBuilder<RequestedMoneyController>(
                            builder: (requestMoneyController) {
                              return ListView(shrinkWrap: true, scrollDirection: Axis.horizontal, children: [
                                RequestTypeButton(
                                  text: 'pending'.tr,
                                  index: 0,
                                  // requestMoneyList: requestMoneyController.ownPendingRequestedMoneyList,
                                  requestMoneyList: widget.isOwn
                                      ? requestMoneyController.ownPendingRequestedMoneyList
                                      : requestMoneyController.pendingRequestedMoneyList,
                                ),
                                SizedBox(width: 10),
                                RequestTypeButton(
                                  text: 'accepted'.tr,
                                  index: 1,
                                  // requestMoneyList: requestMoneyController.ownAcceptedRequestedMoneyList,
                                  requestMoneyList: widget.isOwn
                                      ? requestMoneyController.ownAcceptedRequestedMoneyList
                                      : requestMoneyController.acceptedRequestedMoneyList,
                                ),
                                SizedBox(width: 10),
                                RequestTypeButton(
                                  text: 'denied'.tr,
                                  index: 2,
                                  // requestMoneyList: requestMoneyController.ownDeniedRequestedMoneyList,
                                  requestMoneyList: widget.isOwn
                                      ? requestMoneyController.ownDeniedRequestedMoneyList
                                      : requestMoneyController.deniedRequestedMoneyList,
                                ),
                                SizedBox(width: 10),
                                RequestTypeButton(
                                  text: 'all'.tr,
                                  index: 3,
                                  // requestMoneyList: requestMoneyController.ownRequestList,
                                  requestMoneyList: widget.isOwn ? requestMoneyController.ownRequestList : requestMoneyController.requestedMoneyList,
                                ),
                              ]);
                            },
                          ),
                        ))),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: RequestedMoneyScreen(
                            scrollController: _scrollController,
                            isHome: false,
                            isOwn: widget.isOwn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestTypeButton extends StatelessWidget {
  final String text;
  final int index;
  final List<RequestedMoney> requestMoneyList;

  RequestTypeButton({@required this.text, @required this.index, @required this.requestMoneyList});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.find<RequestedMoneyController>().setIndex(index),
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:
                Get.find<RequestedMoneyController>().requestTypeIndex == index ? Theme.of(context).secondaryHeaderColor : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: .5, color: ColorResources.getGreyColor())),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Text(
            text + '(${requestMoneyList.length})',
            style: montserratSemiBold.copyWith(
              color:
                  Get.find<RequestedMoneyController>().requestTypeIndex == index ? ColorResources.whiteColor : ColorResources.getPrimaryTextColor(),
            ),
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}
