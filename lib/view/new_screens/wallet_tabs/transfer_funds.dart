import 'package:flutter/material.dart';

class TransferFund extends StatefulWidget {
  const TransferFund({Key key}) : super(key: key);

  @override
  State<TransferFund> createState() => _TransferFundState();
}

class _TransferFundState extends State<TransferFund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('TransferFund')),
    );
  }
}
