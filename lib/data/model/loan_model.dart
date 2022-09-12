
List<Loan> loanFromJson(List<dynamic> loans) => loans.map((item) => Loan.fromJson(Map<String, dynamic>.from(item))).toList();

// String LoanToJson(List<Loan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Loan {
  Loan({
    this.id,
    this.loanAmount,
    this.totalRepayment,
    this.status,
    this.nextPayment,
    this.debit,
    this.credit,
    this.dueDate,
    this.currentBalance,
    this.collateral,
    this.paymentTimes,
    this.refId,
  });

  int id;
  String loanAmount;
  String totalRepayment;
  String status;
  String nextPayment;
  String debit;
  String credit;
  String dueDate;
  String currentBalance;
  String collateral;
  String paymentTimes;
  String refId;

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
    id: json["id"],
    loanAmount: json["loan_amount"].toString(),
    totalRepayment: json["total_repayment"].toString(),
    status: json["status"].toString(),
    nextPayment: json["next_payment"].toString(),
    debit: json["debit"].toString(),
    credit: json["credit"].toString(),
    dueDate: json["due_date"].toString(),
    paymentTimes: json["payment_times"].toString(),
    collateral: json["collateral"].toString(),
    currentBalance: json["current_balance"].toString(),
    refId: json["ref_id"].toString(),
  );
}
