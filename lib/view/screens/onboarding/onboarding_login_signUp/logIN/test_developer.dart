import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  const TestApp({Key key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Profile Page',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 70,
              child: Image.asset(
                'assets/newImages/Take a Loan.png',
                scale: 1,
              ),
            ),
          ),
          Text('Oshinoiki Muyiwa Emmanuel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: ('BerlynaDemo-LenZ'))),
          Text(
            'Flutter Developer',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontFamily: ('ChrustyRock')),
          )
        ],
      ),
    );
  }
}
