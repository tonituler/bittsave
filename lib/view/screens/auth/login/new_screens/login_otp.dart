import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import '../../../home/funding_options/request_from_a_riend/friend_identity.dart';
import 'logIn_code.dart';

class OtpPAge extends StatefulWidget {
  const OtpPAge({Key key}) : super(key: key);

  @override
  State<OtpPAge> createState() => _OtpPAgeState();
}

class _OtpPAgeState extends State<OtpPAge> {
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
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Icon(Icons.arrow_back_ios),
                          )),
                      Text(
                        "Enter the code from the sms",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 200),
                    child: Container(
                      margin: EdgeInsets.only(top: 200, left: 80),
                      height: 60,
                      width: double.infinity,
                      // color: Colors.green,
                      child: Expanded(
                        flex: 2,
                        child: TextField(
                          textAlign: TextAlign.start,
                          enableSuggestions: true,
                          style: TextStyle(fontSize: 20, letterSpacing: 12),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: '0 2 6 9',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t receive an SMS?',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Resend SMS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInCode()));
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
