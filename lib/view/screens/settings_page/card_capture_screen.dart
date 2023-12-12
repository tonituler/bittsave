import 'dart:io';
import 'dart:math' as math;

import 'package:bittsave/util/styles.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bittsave/controller/auth_controller.dart';
import 'package:bittsave/controller/image_controller.dart';
import 'package:bittsave/helper/route_helper.dart';
import 'package:bittsave/main.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/util/dimensions.dart';
import 'package:bittsave/view/base/animated_custom_dialog.dart';
import 'package:bittsave/view/base/my_dialog.dart';
import 'package:bittsave/view/screens/auth/selfie_capture/widget/selfie_app_bar.dart';
import 'package:bittsave/view/screens/auth/selfie_capture/widget/text_section.dart';

class CardCaptureScreen extends StatefulWidget {
  final bool fromEditProfile;
  final Function updateState;
  CardCaptureScreen({Key key, @required this.fromEditProfile, @required this.updateState}) : super(key: key);

  @override
  State<CardCaptureScreen> createState() => _CardCaptureScreenState();
}

class _CardCaptureScreenState extends State<CardCaptureScreen> {
  CameraController controller;
  XFile imageFile;
  bool isBack = false;

  @override
  void initState() {
    super.initState();

    controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    );

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).onError((error, stackTrace) {
      print("initialization error is: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    var tmp = MediaQuery.of(context).size;

    tmp = controller.value.previewSize;

    if (!controller.value.isInitialized) {
      return Scaffold(
        body: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () {
        return _onWillPop(context);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: CardCaptureAppbar(
            fromEditProfile: widget.fromEditProfile,
            showIcon: imageFile == null ? false : true,
            onTap: () {
              imageFile = null;
              setState(() {});
            },
            onAccept: () {
              widget.updateState();
            }),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 250,
                width: tmp.width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: imageFile == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: OverflowBox(
                          child: CameraPreview(
                            controller,
                          ),
                        ),
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.file(
                            File(imageFile.path),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                  vertical: Dimensions.PADDING_SIZE_SMALL,
                ),
                decoration:
                    BoxDecoration(color: ColorResources.getWhiteColor(), borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_VERY_SMALL)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Snap your ID'.tr,
                      style: montserratRegular.copyWith(
                        color: ColorResources.getPrimaryColor(),
                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Text(
                      'Snap your passport, NIN or driver license'.tr,
                      style: montserratLight.copyWith(
                        color: ColorResources.getOnboardGreyColor(),
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: ColorResources.getPrimaryColor(),
          padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE),
          child: Container(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorResources.getWhiteColor(),
                width: 4,
              ),
            ),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).cardColor,
              elevation: 0,
              onPressed: () async {
                if (imageFile == null) {
                  imageFile = await controller.takePicture();
                  print(File(imageFile.path));
                  print(imageFile.path);
                  Get.find<ImageController>().setKycImage(File(imageFile.path));
                  setState(() {});
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future _onWillPop(BuildContext context) async {
    return Get.back();
  }
}
