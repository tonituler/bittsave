import 'package:flutter/material.dart';

import '../deshboard/nav_bar.dart';
import '../home/funding_options/request_from_a_riend/friend_identity.dart';

class UsdWithdrawalConfirmation extends StatefulWidget {
  const UsdWithdrawalConfirmation({Key key}) : super(key: key);

  @override
  State<UsdWithdrawalConfirmation> createState() =>
      _UsdWithdrawalConfirmationState();
}

class _UsdWithdrawalConfirmationState extends State<UsdWithdrawalConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: Column(
          children: [
            SizedBox(height: 200),
            Image.asset('assets/newImages/successIcon.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Request Submitted',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'You have successfully submitted a withdrawal transfer request',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 150),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return NavBarScreen();
                }));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                      child: Text(
                    'Back to Dashboard',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
