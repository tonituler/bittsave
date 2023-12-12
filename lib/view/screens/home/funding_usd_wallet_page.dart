import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/helper/price_converter.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/screens/home/funding_options/fund_bit_express.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

class FundingUsdWallet extends StatefulWidget {
  const FundingUsdWallet({Key key}) : super(key: key);

  @override
  State<FundingUsdWallet> createState() => _FundingUsdWalletState();
}

class _FundingUsdWalletState extends State<FundingUsdWallet> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: GetBuilder<ProfileController>(builder: (profileController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: BoldTextTitle(data: 'Funding USD Wallet'),
                    ),
                    // SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'We have rebranding the methods of depositing USD into your wallet.',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20, left: 5, bottom: 40),
                      child: PhysicalModel(
                        elevation: 5,
                        color: Colors.pink,
                        shadowColor: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 180.h,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'USD',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    'assets/image/dollar2.png',
                                    scale: 3,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  '\$${PriceConverter.priceFormater(balance: profileController.userInfo.usdBalance)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28.sp,
                                  ),
                                ),
                              ),
                              Text(
                                'Your Balance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    getFunds(
                      widget: Image.asset(
                        'assets/image/box2.png',
                      ),
                      title: "BitXpress",
                      subTitle: 'Fund your USD wallet using \nour external partners and associates',
                      ontap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const FundBitExpress();
                        }));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    getFunds(
                      ontap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return BittSaveUserRequest();
                        }));
                      },
                      widget: Image.asset('assets/image/plus2.png'),
                      title: 'Request from a friend ',
                      subTitle: 'Fund your USD wallet by requesting funds from bittsave users',
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class BoldTextTitle extends StatelessWidget {
  final String data;
  final double fontSize;
  const BoldTextTitle({Key key, this.data, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: fontSize ?? 22),
    );
  }
}

class BackButtons extends StatelessWidget {
  const BackButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Icon(
          Icons.arrow_back_ios_outlined,
          color: ColorResources.primaryColor,
          size: 20,
        ),
      ),
    );
  }
}

class getFunds extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function ontap;
  final Widget widget;
  const getFunds({this.subTitle, this.title, this.ontap, this.widget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      isThreeLine: true,
      dense: true,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: widget,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5.5),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
        ),
      ),
      subtitle: Text(
        subTitle,
        maxLines: 3,
        // overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11, color: Colors.grey),
      ),
      trailing: Icon(
        CupertinoIcons.forward,
        color: Colors.grey[400],
        size: 25,
      ),
    );
  }
}
