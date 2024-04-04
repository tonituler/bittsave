import 'dart:io';

import 'package:bittsave/app/size_config/config.dart';
import 'package:bittsave/controller/splash_controller.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/util/styles.dart';
import 'package:bittsave/view/base/custom_drop_down.dart';
import 'package:bittsave/view/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/controller/create_account_controller.dart';
import 'package:bittsave/controller/image_controller.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/controller/varification_controller.dart';
import 'package:bittsave/data/api/api_client.dart';
import 'package:bittsave/data/model/body/signup_body.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/custom_snackbar.dart';
import 'package:bittsave/view/screens/auth/pin_set/widget/appbar_section.dart';
import 'package:bittsave/view/screens/auth/pin_set/widget/password_section.dart';

class SecurityQuestionSetScreen extends StatefulWidget {
  final String username, fName, lName, email;
  SecurityQuestionSetScreen({Key key, this.username, this.fName, this.lName, this.email}) : super(key: key);

  @override
  State<SecurityQuestionSetScreen> createState() => _SecurityQuestionSetScreenState();
}

class _SecurityQuestionSetScreenState extends State<SecurityQuestionSetScreen> {
  String question;

  String questionId;

  final TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetBuilder<ImageController>(builder: (controller) {
      return Container(
        color: ColorResources.getPrimaryColor(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorResources.getPrimaryColor(),
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        color: ColorResources.getPrimaryColor(),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: ColorResources.getWhiteColor(),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE,
                  left: 0,
                  right: 0,
                  child: AppbarSection(
                    isLogin: false,
                  ),
                ),
                Positioned(
                  top: 135,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE,
                      vertical: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorResources.getWhiteColor(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_EXTRA_LARGE),
                        topRight: Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_EXTRA_LARGE),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.RADIUS_SIZE_EXTRA_EXTRA_LARGE - 20),
                            child: Text(
                              'Select a question and fill other required fields',
                              textAlign: TextAlign.center,
                              style: montserratMedium.copyWith(
                                color: ColorResources.getPrimaryTextColor(),
                                fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE - 2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, right: 00, top: 20, bottom: 0),
                            child: GetBuilder<SplashController>(builder: (splashController) {
                              return CustomDropDownButton(
                                busy: false,
                                list: splashController.configModel.secretQuestions.map((value) => value["question"].toString()).toList(),
                                onChanged: (value) {
                                  question = value;
                                  Map<String, dynamic> fit =
                                      splashController.configModel.secretQuestions.firstWhere((val) => value == val["question"].toString());
                                  if (fit.isNotEmpty) {
                                    questionId = fit["id"].toString();
                                  }
                                  setState(() {});
                                },
                                title: "Security question",
                                hintText: "Select question",
                                // backgroundColor: Colors.grey[200],
                                backgroundColor: Theme.of(context).highlightColor,
                                bordered: DropDownType.Bordered,
                                value: question,

                              );
                            }),
                          ),
                          const SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          ),
                          Row(
                            children: [
                              Text(
                                'Input your answer',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            controller: answerController,
                            hintText: 'Answer',
                            isShowSuffixIcon: true,
                            isPassword: true,
                            isIcon: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 10),
              child: FloatingActionButton(
                onPressed: () {
                  if (questionId == null || answerController.text.isEmpty) {
                    showCustomSnackBar('Security question and answer must be filled', isError: true);
                  } else {
                    Get.toNamed(RouteHelper.getPinSetRoute(
                      fName: widget.fName,
                      lName: widget.lName,
                      email: widget.email,
                      username: widget.username,
                      answer: answerController.text,
                      questionId: questionId,
                    ));
                  }
                },
                elevation: 0,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child: GetBuilder<AuthController>(
                  builder: (controller) {
                    return !controller.isLoading
                        ? SizedBox(
                            child: Icon(
                              Icons.arrow_forward,
                              color: ColorResources.getBlackColor(),
                              size: 28,
                            ),
                          )
                        : Center(
                            child: SizedBox(height: 20.33, width: 20.33, child: CircularProgressIndicator(color: Theme.of(context).primaryColor)));
                  },
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
