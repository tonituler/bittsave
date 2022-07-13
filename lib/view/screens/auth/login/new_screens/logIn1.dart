import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:six_cash/view/screens/auth/login/new_screens/login_otp.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

class LogIn1 extends StatefulWidget {
  const LogIn1({Key key}) : super(key: key);

  @override
  State<LogIn1> createState() => _LogIn1State();
}

class _LogIn1State extends State<LogIn1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the phone number",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Container(
                      margin: EdgeInsets.only(top: 200, left: 70),
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+ ',
                            style: TextStyle(color: Colors.grey, fontSize: 30),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              // scribbleEnabled: true,
                              textAlign: TextAlign.start,
                              enableSuggestions: true,
                              style: TextStyle(fontSize: 20),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 2),
                                  hintText: '7 (319) 555-0115',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 150, bottom: 12),
                    child: Text(
                      'By clicking "Continue" you agree to the terms of service and tarrifs.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpPAge()));
                    },
                    child: Container(
                      child: InnerContainer(
                          col: Colors.pink,
                          widget: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          data: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
