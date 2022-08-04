// To parse this JSON data, do
//
//     final configModel = configModelFromJson(jsonString);

import 'dart:convert';

ConfigModel configModelFromJson(String str) => ConfigModel.fromJson(json.decode(str));

class ConfigModel {
  ConfigModel({
    this.companyName,
    this.companyLogo,
    this.companyAddress,
    this.companyPhone,
    this.companyEmail,
    this.baseUrls,
    this.currencySymbol,
    this.currencyPosition,
    this.cashOutChargePercent,
    this.addMoneyChargePercent,
    this.sendMoneyChargeFlat,
    this.agentCommissionPercent,
    this.adminCommission,
    this.twoFactor,
    this.phoneVerification,
    this.country,
    this.languageCode,
    this.termsAndConditions,
    this.privacyPolicy,
    this.aboutUs,
    this.themeIndex,
    this.btcValue,
    this.loanCommissionNgn,
    this.loanCommissionUsd,
    this.usdToNgn,
    this.buyBtcRate,
    this.sellBtcRate,
    this.loanPeriod,
    this.loanToValueOptions,
    this.loanRepaymentOption,
    this.loanCreditType,
    this.planPeriod,
    this.planFrequency,
  });

  String companyName;
  String companyLogo;
  String companyAddress;
  String companyPhone;
  String companyEmail;
  BaseUrls baseUrls;
  String currencySymbol;
  String currencyPosition;
  int cashOutChargePercent;
  int addMoneyChargePercent;
  int sendMoneyChargeFlat;
  int agentCommissionPercent;
  int adminCommission;
  bool twoFactor;
  bool phoneVerification;
  String country;
  String languageCode;
  String termsAndConditions;
  String privacyPolicy;
  String aboutUs;
  String themeIndex;
  String btcValue;
  String loanCommissionNgn;
  String loanCommissionUsd;
  String usdToNgn;
  String buyBtcRate;
  String sellBtcRate;
  
  List<Map<String, dynamic>> loanPeriod;
  List<Map<String, dynamic>> loanToValueOptions;
  List<Map<String, dynamic>> loanRepaymentOption;
  List<Map<String, dynamic>> loanCreditType;
  List<Map<String, dynamic>> planPeriod;
  List<Map<String, dynamic>> planFrequency;

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
    companyName: json["company_name"],
    companyLogo: json["company_logo"],
    companyAddress: json["company_address"],
    companyPhone: json["company_phone"].toString(),
    companyEmail: json["company_email"],
    baseUrls: BaseUrls.fromJson(json["base_urls"]),
    currencySymbol: json["currency_symbol"],
    currencyPosition: json["currency_position"] ?? 'left',
    cashOutChargePercent: json["cashout_charge_percent"],
    addMoneyChargePercent: json["addmoney_charge_percent"],
    sendMoneyChargeFlat: json["sendmoney_charge_flat"],
    agentCommissionPercent: json["agent_commission_percent"],
    adminCommission: json["admin_commission"],
    twoFactor: json["two_factor"] == 1 ? true: false,
    phoneVerification: json["phone_verification"] == 1 ? true: false,
    country: json["country"] ?? 'BD',
    languageCode: json["language_code"] ?? 'en',
    termsAndConditions: json["terms_and_conditions"],
    privacyPolicy: json["privacy_policy"],
    aboutUs: json["about_us"],
    themeIndex: json["user_app_theme"],
    btcValue: json["btc_usd"].toString(),
    loanCommissionNgn: json["loan_commission_flat_ngn"].toString(),
    loanCommissionUsd: json["loan_commission_flat_usd"].toString(),
    usdToNgn: json["usd_ngn"].toString(),
    buyBtcRate: json["buy_btc_rate"].toString(),
    sellBtcRate: json["sell_btc_rate"].toString(),
    loanPeriod: List<Map<String, dynamic>>.from(json["loan_period"]),
    loanToValueOptions: List<Map<String, dynamic>>.from(json["loan_to_value_options"]),
    loanRepaymentOption: List<Map<String, dynamic>>.from(json["loan_repayment_option"]),
    loanCreditType: List<Map<String, dynamic>>.from(json["loan_credit_type"]),
    planPeriod: List<Map<String, dynamic>>.from(json["plan_period"]),
    planFrequency: List<Map<String, dynamic>>.from(json["plan_frequency"]),
  );
}

class BaseUrls {
  BaseUrls({
    this.customerImageUrl,
    this.agentImageUrl,
    this.linkedWebsiteImageUrl,
    this.purposeImageUrl,
    this.notificationImageUrl,
    this.companyImageUrl,
    this.bannerImageUrl,
  });

  String customerImageUrl;
  String agentImageUrl;
  String linkedWebsiteImageUrl;
  String purposeImageUrl;
  String notificationImageUrl;
  String companyImageUrl;
  String bannerImageUrl;

  factory BaseUrls.fromJson(Map<String, dynamic> json) => BaseUrls(
    customerImageUrl: json["customer_image_url"],
    agentImageUrl: json["agent_image_url"],
    linkedWebsiteImageUrl: json["linked_website_image_url"],
    purposeImageUrl: json["purpose_image_url"],
    notificationImageUrl: json["notification_image_url"],
    companyImageUrl: json["company_image_url"],
    bannerImageUrl: json["banner_image_url"],
  );
}
