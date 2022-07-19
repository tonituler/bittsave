import 'package:flutter/cupertino.dart';

class AgentModel {
  String name;
  String number;
  String accountNo;
  String bankName;
  String references;
  String amount;
  int id;

  AgentModel({
    @required this.name,
    @required this.number,
    @required this.accountNo,
    @required this.bankName,
    @required this.references,
    @required this.amount,
    @required this.id,
  });

  AgentModel.fromJson(Map<String, dynamic> data) {
    name = data["account_name"];
    number = data["number"];
    bankName = data["bank_name"];
    accountNo = data["account_no"];
    references = data["references"].toString();
    amount = data["amount"].toString();
    id = data["id"];
  }
}

List<AgentModel> dummyAgent = [
  AgentModel(name: 'Jhone walker due', number: '+8801717123456'),
  AgentModel(name: 'Jhone walker due', number: '+8801717123456'),
  AgentModel(name: 'Jhone walker due', number: '+8801717123456')
];
