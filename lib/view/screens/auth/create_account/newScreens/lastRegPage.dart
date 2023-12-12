import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/home/home_screen.dart';

import '../../../home/funding_options/request_from_a_riend/bitsave_user_request.dart';

class LastRegPage extends StatefulWidget {
  const LastRegPage({Key key}) : super(key: key);

  @override
  State<LastRegPage> createState() => _LastRegPageState();
}

class _LastRegPageState extends State<LastRegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: Column(
          children: [
            SizedBox(height: 200),
            Image.asset('assets/newImages/successIcon.png'),
            SizedBox(height: 20),
            Text(
              'Your account created',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Now you can use all the features, Welcome onboard',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 200),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: InnerContainer(
                    col: Colors.pink,
                    data: 15,
                    widget: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
