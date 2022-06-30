import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import '../../../../screens/home/funding_usd_wallet_page.dart';
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
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 20),
                child: Center(
                  child: Text(
                    'Request Successful',
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w300,
                        fontSize: 45),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      Text(
                        'Amount',
                        style: kLightTextStyle.copyWith(
                            color: Colors.black, fontSize: 22),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$1,240.00',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 65, bottom: 10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage('assets/image/logo.png')))),
                      Text(
                        'Alan Santos',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      SizedBox(height: 60),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(18)),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        // color: Colors.pink,
                        width: double.infinity,
                        height: 80,
                        child: Row(
                          children: [
                            Icon(Icons.qr_code_2_sharp, size: 50),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40.0, bottom: 10),
                                    child: Text(
                                      'share with your friend',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 19),
                                    ),
                                  ),
                                  Text(
                                    'Click here to share your QR Code',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.share, color: Colors.pink, size: 30)
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
