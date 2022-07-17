import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Container(
          height: 500,
          width: 300,
          color: Colors.white,
        ),
      ),
    );
  }
}
