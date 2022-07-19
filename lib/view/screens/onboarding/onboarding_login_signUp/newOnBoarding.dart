import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:six_cash/view/screens/auth/login/new_screens/logIn1.dart';

class Onbarding extends StatefulWidget {
  const Onbarding({Key key}) : super(key: key);

  @override
  State<Onbarding> createState() => _OnbardingState();
}

class _OnbardingState extends State<Onbarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        hasFloatingButton: true,
        controllerColor: Colors.pink,
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Get Started',
        finishButtonColor: Colors.pink,
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LogIn1();
                // return TestApp();
              },
            ),
          );
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return LogIn1();
            // return TestApp();
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
<<<<<<< HEAD
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
=======
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
>>>>>>> origin/staging2
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Our unique payment encryption technology will protect your funds',
                    textAlign: TextAlign.center,
<<<<<<< HEAD
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
=======
                    style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
>>>>>>> origin/staging2
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
<<<<<<< HEAD
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
=======
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
>>>>>>> origin/staging2
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You can add any account, card or crypto wallet to the app and make payments',
                    textAlign: TextAlign.center,
<<<<<<< HEAD
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
=======
                    style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
>>>>>>> origin/staging2
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
<<<<<<< HEAD
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
=======
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
>>>>>>> origin/staging2
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You can issue a card without leaving your home. Physical and online cards are available in the application.',
                    textAlign: TextAlign.center,
<<<<<<< HEAD
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
=======
                    style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
>>>>>>> origin/staging2
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
