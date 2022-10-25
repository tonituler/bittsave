
import 'package:flutter/cupertino.dart';

class SignUpBody {
  String fName;
  String lName;
  String email;
  String phone;
  String password;
  String otp;
  String gender;
  String username;

  SignUpBody({
    @required this.fName,
    @required this.lName,
    @required this.phone,
    this.email,
    @required this.password,
    this.otp,
    @required this.gender,
    @required this.username
  });

  SignUpBody.fromJson(Map<String, dynamic> json) {
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    otp = json['otp'];
    gender = json['gender'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['gender'] = this.gender;
    data['username'] = this.username;
    return data;
  }
}