import 'package:flutter/material.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/home/funding_options/fund_bit_express.dart';

import '../../../screens/home/funding_usd_wallet_page.dart';

class PartnersInformation extends StatefulWidget {
  const PartnersInformation({Key key}) : super(key: key);

  @override
  State<PartnersInformation> createState() => _PartnersInformationState();
}

class _PartnersInformationState extends State<PartnersInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 16),
              child: BackButtons(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 35),
              child: Text(
                "Partner's Information",
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LText(subtitle: '37,999.00 NGN', title: "amount you'll send"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "account Name",
                            style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT, fontWeight: FontWeight.w200, color: Colors.black87),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Asaride Peter",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.FONT_SIZE_LARGE),
                          ),
                        ],
                      ),
                    ),
                    LText(subtitle: '646464644 - GTBank', title: "bank Transfer"),
                    LText(subtitle: '#93939393939', title: "references"),
                    SizedBox(
                      height: 20,
                    ),
                    CheckBox(text: 'Do not put any crypto related reference in the narration or remarks e.g Crypto, BTC, Bittsave.'),
                    CheckBox(text: 'Copy the reference provides and paste it in your narration or remarks.'),
                    CheckBox(
                        text: "Be sure to confirm that you've   paid the exact amount into the provided payment channel before clicking the button below."),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                          child: Text(
                        '29.23s',
                        style: TextStyle(color: ColorResources.primaryColor, fontWeight: FontWeight.w500),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 10, left: 20, bottom: 30),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorResources.primaryColor),
                      child: Center(
                        child: Text(
                          'Continue Payment',
                          textAlign: TextAlign.center,
                          style: kLightTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          ],
        ),
      )),
    );
  }

  Widget LText({String subtitle, String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w200, color: Colors.black87),
              ),
              SizedBox(height: 3),
              Text(
                "$subtitle",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.inbox_sharp),
        ],
      ),
    );
  }

  Widget CheckBox({String text}) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListTile(
        minLeadingWidth: 0,
        leading: CircleAvatar(
          radius: 10,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
          backgroundColor: ColorResources.primaryColor,
        ),
        title: Text(
          '$text',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_SMALL + 2),
        ),
      ),
    );
  }
}
