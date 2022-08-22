List<SavingsPlan> savingsPlanFromJson(List<dynamic> SavingsPlans) =>
    SavingsPlans.map((item) => SavingsPlan.fromJson(Map<String, dynamic>.from(item))).toList();

class SavingsPlan {
  SavingsPlan({
    this.id,
    this.amount,
    this.targetAmount,
    this.status,
    this.nextPaymentDate,
    this.name,
    this.gains,
    this.autoInvest,
    this.curentBalance,
    this.endDate,
    this.frequency,
    this.invested,
    this.limit,
    this.listedPlan,
    this.lockPeriod,
    this.nextPayment,
    this.numberLeft,
    this.offset,
    this.planBalance,
    this.roi,
    this.startDate,
    this.totalEarning,
    this.totalSize,
    this.creditType,
  });

  int id;
  String amount;
  String name;
  String gains;
  String status;
  String targetAmount;
  String nextPaymentDate;
  String roi;
  String invested;
  String curentBalance;
  String lockPeriod;
  String nextPayment;
  String startDate;
  String endDate;
  String numberLeft;
  int autoInvest;
  String totalEarning;
  String planBalance;
  String frequency;
  String totalSize;
  String limit;
  String offset;
  String creditType;
  List<Map<String, dynamic>> listedPlan;

  factory SavingsPlan.fromJson(Map<String, dynamic> json) => SavingsPlan(
        id: json["id"],
        gains: json["gains"].toString(),
        amount: json["amount"].toString(),
        name: json["name"].toString(),
        status: json["status"].toString(),
        nextPaymentDate: json["next_payment_date"].toString(),
        targetAmount: json["target_amount"].toString(),
        autoInvest: json["auto_invest"],
        curentBalance: json["current_balance"].toString(),
        endDate: json["end_date"].toString(),
        startDate: json["start_date"].toString(),
        frequency: json["frequency"].toString(),
        invested: json["invested"].toString(),
        limit: json["limit"].toString(),
        listedPlan: List<Map<String, dynamic>>.from(json["listed_plan"] ?? []),
        lockPeriod: json["lock_period"].toString(),
        nextPayment: json["next_payment"].toString(),
        numberLeft: json["number_left"].toString(),
        offset: json["offset"].toString(),
        planBalance: json["plan_balance"].toString(),
        roi: json["roi"].toString(),
        totalEarning: json["total_earning"].toString(),
        totalSize: json["total_size"].toString(),
        creditType: json["credit_type"].toString(),
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "gains": gains,
      "amount": amount,
      "name": name,
      "status": status,
      "next_payment_date": nextPaymentDate,
      "target_amount": targetAmount,
      "auto_invest": autoInvest,
      "current_balance": curentBalance,
      "end_date": endDate,
      "start_date": startDate,
      "frequency": frequency,
      "invested": invested,
      "limit": limit,
      "listed_plan": listedPlan,
      "lock_period": lockPeriod,
      "next_payment": nextPayment,
      "number_left": numberLeft,
      "offset": offset,
      "plan_balance": planBalance,
      "roi": roi,
      "total_earning": totalEarning,
      "total_size": totalSize,
      "credit_type": creditType,
    };
  }
}
