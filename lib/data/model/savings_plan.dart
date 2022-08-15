
List<SavingsPlan> savingsPlanFromJson(List<dynamic> SavingsPlans) => SavingsPlans.map((item) => SavingsPlan.fromJson(Map<String, dynamic>.from(item))).toList();

class SavingsPlan {
  SavingsPlan({
    this.id,
    this.amount,
    this.targetAmount,
    this.status,
    this.nextPaymentDate,
    this.name,
    this.gains,
  });

  int id;
  String amount;
  String name;
  String gains;
  String status;
  String targetAmount;
  String nextPaymentDate;

  factory SavingsPlan.fromJson(Map<String, dynamic> json) => SavingsPlan(
    id: json["id"],
    gains: json["gains"].toString(),
    amount: json["amount"].toString(),
    name: json["name"].toString(),
    status: json["status"].toString(),
    nextPaymentDate: json["next_payment_date"].toString(),
    targetAmount: json["target_amount"].toString(),
  );
}
