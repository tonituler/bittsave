import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/main.dart';
import 'package:six_cash/view/base/custom_drop_down.dart';
import 'package:six_cash/view/screens/profile/widget/appbar.dart';
import 'package:six_cash/view/screens/settings_page/kycScan.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class KycTwoSteps extends StatefulWidget {
  const KycTwoSteps({Key key}) : super(key: key);

  @override
  State<KycTwoSteps> createState() => _KycTwoStepsState();
}

class _KycTwoStepsState extends State<KycTwoSteps> {
  String state;
  String country;

  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar.myAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Text('KYC-Step Two', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Let us know your location as it reflect on your proof of Identification',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 12, top: 0, bottom: 2),
                  child: GetBuilder<SplashController>(builder: (splashController) {
                    return CustomDropDownButton(
                      busy: false,
                      list: ["Nigeria"],
                      onChanged: (value) {
                        country = value;
                        setState(() {});
                      },
                      title: "Country",
                      hintText: "Select a country",
                      backgroundColor: Colors.grey[200],
                      bordered: DropDownType.Bordered,
                      value: country,
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 12, top: 0, bottom: 2),
                  child: GetBuilder<SplashController>(builder: (splashController) {
                    return CustomDropDownButton(
                      busy: false,
                      list: splashController.configModel.stateRegion.map((value) => value["name"].toString()).toList(),
                      onChanged: (value) {
                        state = value;
                        setState(() {});
                      },
                      title: "State/Region/Province",
                      hintText: "Select a state",
                      backgroundColor: Colors.grey[200],
                      bordered: DropDownType.Bordered,
                      value: state,
                    );
                  }),
                ),
                textCont('City', 'Ikeji'),
                textCont('House no', 'Plot 505 or House 5'),
                textCont('Address', 'Street name'),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KycScan()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: Center(
                          child: Text(
                        'Save and continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textCont(String titleText, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 12, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titleText',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: '    $hintText',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget textCont2(String titleText, String hintText, Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 12, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titleText',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                filled: true,
                suffixIcon: icon,
                fillColor: Colors.grey[200],
                hintText: '    $hintText',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
