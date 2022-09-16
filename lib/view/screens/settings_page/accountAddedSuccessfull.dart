import 'package:flutter/material.dart';

import '../deshboard/nav_bar.dart';
import '../home/funding_options/request_from_a_riend/friend_identity.dart';

class AccountAdded extends StatefulWidget {
  AccountAdded({Key key, @required this.slug}) : super(key: key);
  String slug;

  @override
  State<AccountAdded> createState() => _AccountAddedState();
}

class _AccountAddedState extends State<AccountAdded> {
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
                'Account ' + ((widget.slug == "create") ? "Added" : "Updated"),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'You have successfully submitted your destination bank account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 150),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return NavBarScreen();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                      child: Text(
                    'Return to dashboard',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )),
                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
