import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/savings_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/data/model/savings_plan.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/base/custom_drop_down.dart';
import 'package:bittsave/view/screens/home/home_screen.dart';

import '../../../../util/dimensions.dart';
import '../../wallet/widget/confirm_friendIdentity.dart';
import '../funding_usd_wallet_page.dart';

class EditPlan extends StatefulWidget {
  EditPlan({Key key, @required this.savingsPlan}) : super(key: key);
  SavingsPlan savingsPlan;

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  String frequency;
  String credit;
  String autoInvest;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    name.text = widget.savingsPlan.name;
    amount.text = widget.savingsPlan.invested;
    frequency = getFrequency(widget.savingsPlan.frequency);
    credit = (widget.savingsPlan.creditType == "usd_wallet") ? "USD Wallet" : "BTC";
    autoInvest = (widget.savingsPlan.autoInvest == 1) ? "Yes" : "No";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(builder: (splashController) {
        return BackGroundColr(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('Edit Plan', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'I think, I changed my mind',
                        style: TextStyle(color: Colors.grey[800], fontSize: Dimensions.FONT_SIZE_LARGE),
                      ),
                    ),
                    SizedBox(height: 20),
                    textCont(
                      titleText: 'Plan name',
                      hintText: 'My Rent',
                      controller: name,
                    ),
                    textCont(
                      titleText: "Amount (\$)",
                      hintText: '20',
                      controller: amount,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: CustomDropDownButton(
                        title: 'Frequency',
                        hintText: 'Choose frequency',
                        value: frequency,
                        backgroundColor: ColorResources.textFieldColor,
                        bordered: DropDownType.Bordered,
                        busy: false,
                        onChanged: (a) {
                          frequency = a;
                          setState(() {});
                        },
                        list: splashController.configModel.planFrequency.map((e) => e["name"].toString()).toList(),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child: CustomDropDownButton(
                          title: 'Credit',
                          hintText: 'Choose credit type',
                          value: credit,
                          backgroundColor: ColorResources.textFieldColor,
                          bordered: DropDownType.Bordered,
                          busy: false,
                          onChanged: (a) {
                            credit = a;
                            setState(() {});
                          },
                          list: ["BTC", "USD Wallet"],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: CustomDropDownButton(
                        title: 'Auto Invest',
                        hintText: 'Choose type',
                        value: autoInvest,
                        backgroundColor: ColorResources.textFieldColor,
                        bordered: DropDownType.Bordered,
                        busy: false,
                        onChanged: (a) {
                          autoInvest = a;
                          setState(() {});
                        },
                        list: ["No", "Yes"],
                      ),
                    ),
                    SizedBox(height: 20),
                    GetBuilder<SavingsController>(builder: (controller) {
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
                          'Update Plan',
                          textColor: Colors.white,
                          buttonColor: ColorResources.primaryColor,
                          fontSize: 18.sp,
                          busy: loading,
                          fontWeight: FontWeight.w400,
                          height: 54.h,
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            bool response = await controller.updateSavings({
                              "credit_type": (credit == "BTC") ? "btc" : "usd_wallet",
                              "auto_invest": (autoInvest == "Yes") ? 1 : 0,
                              "frequency": getFrequencyValue(frequency),
                              "amount": amount.text,
                              "name": name.text,
                              "id": widget.savingsPlan.id,
                            });
                            setState(() {
                              loading = false;
                            });

                            if (response) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  String getFrequencyValue(String value) {
    String _frequency = "0";
    List<Map<String, dynamic>> freq = Get.find<SplashController>().configModel.planFrequency;
    freq.forEach((element) {
      if (value == element["name"].toString()) {
        _frequency = element["value"].toString();
      }
    });
    return _frequency;
  }

  String getFrequency(String frequencyId) {
    String _frequency = "Weekly";
    List<Map<String, dynamic>> freq = Get.find<SplashController>().configModel.planFrequency;
    freq.forEach((element) {
      if (frequencyId == element["value"].toString()) {
        _frequency = element["name"];
      }
    });
    return _frequency;
  }

  Widget textCont({
    String titleText,
    String hintText,
    TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 12, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titleText',
            style: TextStyle(fontWeight: FontWeight.w500, color: ColorResources.primaryColor, fontSize: Dimensions.FONT_SIZE_LARGE),
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: Dimensions.FONT_SIZE_LARGE),
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: '    $hintText',
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
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
                contentPadding: EdgeInsets.symmetric(vertical: 4),
                hintText: '    $hintText',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
