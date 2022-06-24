import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/friend_identity.dart';

import '../../funding_usd_wallet_page.dart';
import '../fund_bit_express.dart';

class RequestSuccessful extends StatefulWidget {
  const RequestSuccessful({Key key}) : super(key: key);

  @override
  State<RequestSuccessful> createState() => _RequestSuccessfulState();
}

class _RequestSuccessfulState extends State<RequestSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              BackButtons(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                child: Center(
                  child: Text(
                    'Request Successful',
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w300,
                        fontSize: 25),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Amount',
                        style: kLightTextStyle.copyWith(
                            color: Colors.grey, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$1,240.00',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 40, bottom: 10),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  scale: 3,
                                  image: AssetImage('assets/image/logo.png')))),
                      Text(
                        'Alan Santos',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(18)),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        // padding: EdgeInsets.symmetric(horizontal: 12),
                        // color: Colors.pink,
                        width: double.infinity,
                        height: 70,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.qr_code_2_sharp, size: 30),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 35.0, bottom: 5),
                                    child: Text(
                                      'share with your friend',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                    'Click here to share your QR Code',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.share,
                                  color: Colors.pink, size: 25),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget InnerContainer(
      {double height,
      Color col,
      double data,
      String text,
      TextStyle style,
      Widget widget}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: col, borderRadius: BorderRadius.circular(data)),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
