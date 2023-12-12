import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/controller/edit_profile_controller.dart';
import 'package:bittsave/controller/image_controller.dart';
import 'package:bittsave/data/api/api_client.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/base/buttons.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';
import 'package:bittsave/view/screens/settings_page/card_capture_screen.dart';
import 'package:bittsave/view/screens/settings_page/kyc_confirmation.dart';

class KycScan extends StatefulWidget {
  const KycScan({Key key}) : super(key: key);

  @override
  State<KycScan> createState() => _KycScanState();
}

class _KycScanState extends State<KycScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<EditProfileController>(builder: (profileEditController) {
          return Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButtons(),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0, top: 10),
                      child: Image.asset('assets/newImages/flashIcon.png'),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: Text('KYC-Step Three', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Let us know your location as it reflect on your proof of Identification',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardCaptureScreen(
                              fromEditProfile: false,
                              updateState: updateState,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 100, left: 10, right: 10),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: (Get.find<ImageController>().getKycImageFile != null)
                            ? Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    File(Get.find<ImageController>().getKycImageFile.path),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                "Tap here",
                                style: TextStyle(fontSize: 20),
                              )),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        'Snap your passport, NIN or driver license',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 35.w,
                        ),
                        child: buttonWithBorder(
                          'Upload ID',
                          textColor: Colors.white,
                          buttonColor: ColorResources.primaryColor,
                          fontSize: 18.sp,
                          busy: profileEditController.isLoadingKYCUpdate,
                          fontWeight: FontWeight.w400,
                          diabled: Get.find<ImageController>().getKycImageFile == null,
                          height: 54.h,
                          onTap: () async {
                            File _image = Get.find<ImageController>().getKycImageFile;

                            List<MultipartBody> _multipartBody;
                            if (_image != null) {
                              _multipartBody = [MultipartBody('identification', _image)];
                            } else {
                              _multipartBody = [];
                            }
                            await profileEditController.updateUserKYCData({
                              '_method': 'post',
                            }, _multipartBody, callback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KYConfirmation(),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => KYConfirmation(),
                    //         ),
                    //       );
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
                    //       child: Container(
                    //         width: double.infinity,
                    //         height: 40,
                    //         child: Center(
                    //             child: Text(
                    //           'Return to dashboard',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(color: Colors.white),
                    //         )),
                    //         decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  updateState() {
    setState(() {});
  }
}
