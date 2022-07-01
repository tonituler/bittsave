import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/home_screen.dart';

class Onbarding extends StatefulWidget {
  const Onbarding({Key key}) : super(key: key);

  @override
  State<Onbarding> createState() => _OnbardingState();
}

class _OnbardingState extends State<Onbarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: OnBoardingSlider(
          hasFloatingButton: true,
          controllerColor: Colors.pink,
          headerBackgroundColor: Colors.white,
          finishButtonText: 'Continue',
          finishButtonColor: Colors.pink,
          onFinish: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          },
          background: [
            Image.asset('assets/newImages/1Image.png'),
            Image.asset('assets/newImages/2ndImage.png'),
            Image.asset('assets/newImages/3rdImage.png'),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 450,
                    ),
                    Center(
                      child: Text(
                        'Secure Payment',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Our unique payment encryption technology will protect your funds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 450,
                    ),
                    Center(
                      child: Text(
                        'Add any accounts',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'You can add any account, card or crypto wallet to the app and make payments',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 450,
                    ),
                    Center(
                      child: Text(
                        'Custom card',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'You can issue a card without leaving your home. Physical and online cards are available in the application.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
