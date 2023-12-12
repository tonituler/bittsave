import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/auth/create_account/newScreens/lastRegPage.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

class CheckInfoRegPage extends StatefulWidget {
  const CheckInfoRegPage({Key key}) : super(key: key);
  @override
  State<CheckInfoRegPage> createState() => _CheckInfoRegPageState();
}

class _CheckInfoRegPageState extends State<CheckInfoRegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 5),
                            child: Icon(Icons.arrow_back_ios),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Check your info',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  fieldCont(text: 'First Name', fieldText: 'Bola'),
                  SizedBox(height: 20),
                  fieldCont(text: 'Last Name', fieldText: 'Musa'),
                  SizedBox(height: 20),
                  fieldCont(text: 'Email Address', fieldText: 'johnasam@gmail.com'),
                  SizedBox(height: 20),
                  fieldCont(text: 'Username', fieldText: '@johnsam'),
                  SizedBox(height: 20),
                  fieldCont(text: 'Date of Expiration', fieldText: 'April 21, 2026'),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LastRegPage()));
                    },
                    child: Container(
                      child: InnerContainer(
                          col: Colors.pink,
                          data: 15,
                          widget: Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
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

  Widget fieldCont({String text, String fieldText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$text',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black, fontSize: 15, letterSpacing: 0.9, fontWeight: FontWeight.w500),
              hintText: '$fieldText',
              filled: true,
              fillColor: Colors.grey[200],
              border: InputBorder.none),
        )
      ],
    );
  }
}
