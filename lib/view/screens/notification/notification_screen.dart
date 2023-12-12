import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/notification_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/util/styles.dart';
import 'package:bittsave/view/base/custom_ink_well.dart';
import 'package:bittsave/view/base/no_data_screen.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';
import 'package:bittsave/view/screens/notification/widget/notification_dialog.dart';
import 'package:bittsave/view/screens/notification/widget/notification_shimmer.dart';
import 'package:bittsave/view/screens/profile/widget/appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar.myAppBar(),
        body: RefreshIndicator(
          onRefresh: () async {
            await Get.find<NotificationController>().getNotificationList();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                BoldTextTitle(
                  data: 'Notification',
                ),
                Expanded(
                  child: GetBuilder<NotificationController>(
                    builder: (notification) {
                      return notification.notificationList == null
                          ? NotificationShimmer()
                          : notification.notificationList.length > 0
                              ? ListView.builder(
                                  itemCount: notification.notificationList.length,
                                  padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      color: Theme.of(context).cardColor,
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      child: CustomInkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => NotificationDialog(notificationModel: notification.notificationList[index]));
                                        },
                                        highlightColor: ColorResources.getPrimaryColor().withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: Dimensions.PADDING_SIZE_SMALL, horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(notification.notificationList[index].title,
                                                      style: montserratSemiBold.copyWith(
                                                          fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor())),
                                                  SizedBox(
                                                    height: Dimensions.PADDING_SIZE_SMALL,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width * 0.6,
                                                    child: Text(notification.notificationList[index].description,
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: montserratRegular.copyWith(
                                                            fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor())),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_EXTRA_SMALL),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder: Images.placeholder,
                                                  height: 30,
                                                  width: 30,
                                                  fit: BoxFit.cover,
                                                  image:
                                                      '${Get.find<SplashController>().configModel.baseUrls.notificationImageUrl}/${notification.notificationList[index].image}',
                                                  imageErrorBuilder: (c, o, s) =>
                                                      Image.asset(Images.placeholder, height: 30, width: 30, fit: BoxFit.cover),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : NoDataFoundScreen();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
