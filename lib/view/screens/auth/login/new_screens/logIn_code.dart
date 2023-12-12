import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/auth/create_account/newScreens/scan_Page.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

class LogInCode extends StatefulWidget {
  const LogInCode({Key key}) : super(key: key);

  @override
  State<LogInCode> createState() => _LogInCodeState();
}

class _LogInCodeState extends State<LogInCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: AssetImage('assets/image/about_us.png'))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jerome Bell',
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '+7 (319) 555-0115',
                              style: TextStyle(color: Colors.grey, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Change',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  'Enter Code',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23.0),
                // child: TextField(
                //   textAlign: TextAlign.center,
                //   obscureText: true,
                //   enableSuggestions: true,
                //   style: TextStyle(fontSize: 20, letterSpacing: 12),
                //   keyboardType: TextInputType.phone,
                //   decoration: InputDecoration(
                //       contentPadding: EdgeInsets.only(left: 2),
                //       hintText: '0 2 6 9',
                //
                //       border: InputBorder.none,
                //       hintStyle: TextStyle(color: Colors.black, fontSize: 20)),
                // ),

                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundColor: Colors.pink, radius: 7),
                      SizedBox(width: 7),
                      CircleAvatar(backgroundColor: Colors.pink, radius: 7),
                      SizedBox(width: 7),
                      CircleAvatar(backgroundColor: Colors.pink, radius: 7),
                      SizedBox(width: 7),
                      CircleAvatar(backgroundColor: Colors.pink, radius: 7),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              numericCont(text: '1'),
                              numericCont(text: '2'),
                              numericCont(text: '3'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              numericCont(text: '4'),
                              numericCont(text: '5'),
                              numericCont(text: '6'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              numericCont(text: '7'),
                              numericCont(text: '8'),
                              numericCont(text: '9'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              numericCont2(Container()),
                              numericCont(text: '0'),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage()));
                                },
                                child: numericCont2(Image.asset('assets/newImages/Icon.png')),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numericCont({String text}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 100,
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }

  Widget numericCont2(Widget widget) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 100,
        height: 80,
        child: Center(child: widget),
      ),
    );
  }
}
