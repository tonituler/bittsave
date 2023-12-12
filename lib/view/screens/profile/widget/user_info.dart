import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/util/images.dart';
import 'package:bittsave/util/styles.dart';
import 'package:bittsave/view/screens/profile/widget/bootom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  final ProfileController profileController;
  const UserInfo({
    Key key,
    @required this.profileController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).cardColor,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_LARGE),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          profileController.userInfo != null
              ? Column(
                  children: [
                    Container(
                      width: Dimensions.SIZE_PROFILE_AVATAR,
                      height: Dimensions.SIZE_PROFILE_AVATAR,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_PROFILE_AVATAR)),
                          border: Border.all(width: 1, color: Theme.of(context).highlightColor)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_PROFILE_AVATAR)),
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          image: "${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${profileController.userInfo.image}",
                          placeholder: Images.avatar,
                          imageErrorBuilder: (context, url, error) => Image.asset(
                            Images.avatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text('${profileController.userInfo.fName} ${profileController.userInfo.lName}',
                              style: montserratMedium.copyWith(color: ColorResources.getBlackColor(), fontSize: Dimensions.FONT_SIZE_LARGE),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            '${profileController.userInfo.phone}',
                            style: montserratMedium.copyWith(color: ColorResources.getGreyBaseGray1(), fontSize: Dimensions.FONT_SIZE_LARGE),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(),
          InkWell(
            onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: false,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.RADIUS_SIZE_LARGE))),
                builder: (context) => ProfileQRCodeBottomSheet()),
            child: GetBuilder<ProfileController>(builder: (controller) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Theme.of(context).secondaryHeaderColor,
                ),
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.string(
                  controller.userInfo.qrCode,
                  height: 24,
                  width: 24,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
