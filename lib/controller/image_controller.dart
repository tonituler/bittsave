import 'dart:io';
import 'package:get/get.dart';
class ImageController extends GetxController implements GetxService{

  File _imageFile;
  File _kycImageFile;
  File get getImage => _imageFile;
  File get getKycImageFile => _kycImageFile;
  void setImage(File image){
    _imageFile = image;
    update();
  }
  void setKycImage(File image){
    _kycImageFile = image;
    update();
  }
  void removeImage(){
    _imageFile = null;
    update();
  }

  void removeKycImage(){
    _kycImageFile = null;
    update();
  }
  
}