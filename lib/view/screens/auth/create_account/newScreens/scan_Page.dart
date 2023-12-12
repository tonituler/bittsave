import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/auth/create_account/newScreens/regPage2.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 10),
                        child: Icon(Icons.arrow_back_ios),
                      )),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 10),
                    child: Image.asset('assets/newImages/flashIcon.png'),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CheckInfoRegPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 180, left: 10, right: 10),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all(color: Colors.blue, width: 1), borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Scan your passport or driver license',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
