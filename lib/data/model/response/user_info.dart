import 'dart:convert';

import 'package:flutter_contacts/properties/address.dart';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

// String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.username,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    this.type,
    this.gender,
    this.occupation,
    this.twoFactor,
    this.fcmToken,
    this.balance,
    this.uniqueId,
    this.qrCode,
    this.usdBalance,
    this.btcBalance,
    this.btcBalanceInUSD,
    this.btcInSatoshis,
    this.btcCollateralUsed,
    this.invested,
    this.returns,
    this.investedBalanceBTC,
    this.investedBalanceUSD,
    this.isKycVerified,

    this.accountName,
    this.accountNo,
    this.bankName,
    this.city,
    this.stateRegion,
    this.address,
    this.country,
  });

  String username;
  String fName;
  String lName;
  String phone;
  String email;
  String image;
  int type;
  String gender;
  String occupation;
  bool twoFactor;
  String fcmToken;
  double balance;
  String uniqueId;
  String qrCode;
  double usdBalance;
  double btcBalanceInUSD;
  double btcBalance;
  double btcInSatoshis;
  double btcCollateralUsed;
  double invested;
  double returns;
  double investedBalanceUSD;
  double investedBalanceBTC;
  int isKycVerified;

  String accountName;
  String accountNo;
  String bankName;
  String stateRegion;
  String city;
  String address;
  String country;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        username: json["username"],
        fName: json["f_name"],
        lName: json["l_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        type: json["type"],
        gender: json["gender"],
        occupation: json["occupation"],
        twoFactor: json["two_factor"] == 1 ? true : false,
        fcmToken: json["fcm_token"],
        balance: json["balance"].toDouble() ?? 0.0,
        uniqueId: json["unique_id"],
        qrCode: json["qr_code"],
        usdBalance: json["usd_balance"].toDouble() ?? 0.0,
        btcBalanceInUSD: json["btc_balance_in_usd"].toDouble() ?? 0.0,
        btcBalance: json["btc_balance"].toDouble() ?? 0.0,
        btcInSatoshis: json["btc_in_satoshis"].toDouble() ?? 0.0,
        btcCollateralUsed: json["btc_collateral_used"].toDouble() ?? 0.0,
        invested: json["invested"].toDouble() ?? 0.0,
        returns: json["returns"].toDouble() ?? 0.0,
        investedBalanceBTC: json["investment_balance_btc"].toDouble() ?? 0.0,
        investedBalanceUSD: json["investment_balance_usd"].toDouble() ?? 0.0,
        isKycVerified: json["is_kyc_verified"] ?? 0,

        accountName: json["account_name"],
        accountNo: json["account_no"],
        bankName: json["bank_name"],
        stateRegion: json["state_region"],
        city: json["city"],
        address: json["address"],
        country: json["country:"],
      );
}
