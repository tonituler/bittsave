import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/home/funding_options/fund_bit_express.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';

class BittSaveUserRequest extends StatefulWidget {
  const BittSaveUserRequest({Key key}) : super(key: key);

  @override
  State<BittSaveUserRequest> createState() => _BittSaveUserRequestState();
}

class _BittSaveUserRequestState extends State<BittSaveUserRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundColr(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              BackButtons(),
              BoldTextTitle(
                data: 'Request from Bittsave\nUser',
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 12, bottom: 100),
                child: Text(
                  'Request from  Bittsave\nUser',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorResources.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    cursorColor: ColorResources.primaryColor,
                    cursorWidth: 1,
                    autofocus: true,
                    maxLines: 1,

                    // style: GoogleFonts.mulish(
                    //   color: AppColors.black,
                    //   fontWeight: FontWeight.w500,
                    //   fontSize: 15.sp,
                    //   letterSpacing: 0.4,
                    // ),
                    decoration: InputDecoration(
                      counterText: '',
                      fillColor: ColorResources.primaryColor.withOpacity(0.5),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      hintText: "Bittsave username",
                      // hintStyle: GoogleFonts.mulish(
                      //   color: AppColors.textGrey,
                      //   fontWeight: FontWeight.w400,
                      //   fontSize: 12.sp,
                      // ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorResources.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorResources.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorResources.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorResources.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // controller: controller,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(height: 200),
              InnerContainer(
                data: 10,
                col: ColorResources.primaryColor,
                height: 50,
                style: kLightTextStyle,
                widget: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Widget InnerContainer(
    {double height, Color col, double data, TextStyle style, Widget widget}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration:
          BoxDecoration(color: col, borderRadius: BorderRadius.circular(data)),
      child: Center(
        child: widget,
      ),
    ),
  );
}
