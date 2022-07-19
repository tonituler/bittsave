import 'package:flutter/material.dart';

import '../deshboard/nav_bar.dart';
import '../home/funding_options/request_from_a_riend/friend_identity.dart';

class AccountUpdated extends StatefulWidget {
  const AccountUpdated({Key key}) : super(key: key);

  @override
  State<AccountUpdated> createState() => _AccountUpdatedState();
}

class _AccountUpdatedState extends State<AccountUpdated> {
  @override
  Widget build(BuildContext context) {
    body:
    BackGroundColr(
      child: Column(
        children: [
          SizedBox(height: 200),
          Image.asset('assets/newImages/successIcon.png'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Your Profile updated',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Now you can use all the features. Welcome on board',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
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
                  'Back to settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                    color: Colors.pink, borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
