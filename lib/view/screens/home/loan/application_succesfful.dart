import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/home_screen.dart';


class ApplicationSuccessful extends StatefulWidget {
  const ApplicationSuccessful({Key key}) : super(key: key);

  @override
  State<ApplicationSuccessful> createState() => _ApplicationSuccessfulState();
}

class _ApplicationSuccessfulState extends State<ApplicationSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/newImages/Take a Loan.png',
                  scale: 0.7,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text('Application Successful',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'Your, account have been credited, You can now check your wallet balance',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: Container(
                  child: InnerContainer(
                    col: Colors.pink,
                    widget: Center(
                        child: Text(
                      'Back to home',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
