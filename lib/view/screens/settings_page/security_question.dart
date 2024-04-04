import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/data/model/response/user_info.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/base/custom_drop_down.dart';
import 'package:bittsave/view/screens/settings_page/accountAddedSuccessfull.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class UpdateSecurityQuestion extends StatefulWidget {
  UpdateSecurityQuestion({Key key, @required this.accountType}) : super(key: key);
  String accountType;

  @override
  State<UpdateSecurityQuestion> createState() => _AddPaymentAccountState();
}

class _AddPaymentAccountState extends State<UpdateSecurityQuestion> {
  String question;
  String questionId;
  String accountId = "";
  TextEditingController answerController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  bool shouldUpdate;

  @override
  void initState() {
    super.initState();

    // List<Map<String, dynamic>> allBanks = Get.find<SplashController>().configModel.bankList;
    ProfileController pC = Get.find<ProfileController>();
    UserInfo user = pC.userInfo;
    pC.isLoadingAccountUpdate = false;

    // splashController.configModel.bankList.map((value) => value["value"].toString()).toList(),

    // if (widget.accountType == "ngn") {
    //   if (user.bankAccounts != null || user.bankAccounts.isNotEmpty) {
    //     List<dynamic> accounts = user.bankAccounts.where((element) => Map<String, dynamic>.from(element)["account_type"] == "NGN").toList();
    //     if (accounts.isNotEmpty) {
    //       Map<String, dynamic> account = accounts[0];

    //       accountNameController.text = account["account_name"];
    //       accountNoController.text = account["account_no"].toString();
    //       accountId = account["id"].toString();

    //       //check if the bank name is available in the list comming from the database
    //       // to aoid dropdown widget error
    //       List<Map<String, dynamic>> allSelBanks = allBanks.where((element) => element["value"].toString() == account["bank_name"]).toList();
    //       if (allSelBanks.isNotEmpty) {
    //         bank = account["bank_name"];
    //       }
    //     }
    //   }
    // }

    // if (widget.accountType == "usd") {
    //   if (user.bankAccounts != null || user.bankAccounts.isNotEmpty) {
    //     List<dynamic> accounts = user.bankAccounts.where((element) => Map<String, dynamic>.from(element)["account_type"] == "USD").toList();
    //     if (accounts.isNotEmpty) {
    //       Map<String, dynamic> account = accounts[0];
    //       accountNameController.text = account["account_name"];
    //       accountNoController.text = account["account_no"].toString();
    //       accountId = account["id"].toString();

    //       //check if the bank name is available in the list comming from the database
    //       // to aoid dropdown widget error
    //       List<Map<String, dynamic>> allSelBanks = allBanks.where((element) => element["value"].toString() == account["bank_name"]).toList();
    //       if (allSelBanks.isNotEmpty) {
    //         bank = account["bank_name"];
    //       }
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: GetBuilder<ProfileController>(builder: (profileController) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text('Change security question', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Select a question and fill other required fields',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 10, top: 20, bottom: 0),
                      child: GetBuilder<SplashController>(builder: (splashController) {
                        return CustomDropDownButton(
                          busy: false,
                          list: splashController.configModel.secretQuestions.map((value) => value["question"].toString()).toList(),
                          onChanged: (value) {
                            question = value;
                            Map<String, dynamic> fit =
                                splashController.configModel.secretQuestions.firstWhere((val) => value == val["question"].toString());
                            if (fit.isNotEmpty) {
                              questionId = fit["id"];
                            }
                            setState(() {});
                          },
                          title: "Security question",
                          hintText: "Select question",
                          backgroundColor: Colors.grey[200],
                          bordered: DropDownType.Bordered,
                          value: question,
                        );
                      }),
                    ),
                    textCont(
                      'Answer',
                      'Enter your answer',
                      controller: answerController,
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 12,
                        top: 14,
                      ),
                    ),
                    textCont(
                      'Pin',
                      'Enter your pin',
                      controller: pinController,
                      obscureText: true,
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 12,
                        top: 14,
                      ),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: Container(
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: buttonWithBorder(
                          'Save Change',
                          textColor: ColorResources.getWhiteColor(),
                          buttonColor: ColorResources.primaryColor,
                          fontSize: 18.sp,
                          busy: profileController.isLoadingAccountUpdate,
                          diabled: false,
                          borderRadius: 12,
                          fontWeight: FontWeight.w400,
                          height: 100.h,
                          onTap: () async {
                            Map<String, dynamic> credentials = {
                              "new_answer": answerController.text,
                              "question_id": questionId,
                              "pin": pinController.text,
                            };

                            profileController.updateSecurityQuestion(context, credentials, () {
                              answerController.text = "";
                              pinController.text = "";
                              questionId = null;
                              question = null;
                              setState(() {});
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget textCont(String titleText, String hintText, {TextEditingController controller, EdgeInsetsGeometry padding, bool obscureText}) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 20.0, right: 12, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titleText',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: '    $hintText',
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
