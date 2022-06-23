import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../funding_usd_wallet_page.dart';

const kLightTextStyle = TextStyle(
    color: Colors.pinkAccent, fontSize: 20, fontWeight: FontWeight.w300);

class FundBitExpress extends StatefulWidget {
  const FundBitExpress({Key key}) : super(key: key);

  @override
  State<FundBitExpress> createState() => _FundBitExpressState();
}

class _FundBitExpressState extends State<FundBitExpress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 10),
                child: BackButtons(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 30, bottom: 10),
                child: BoldTextTitle(
                  data: 'How much do you want to\ndeposit?',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 3.0, bottom: 10),
                child: LightText(text: 'Exchange rate: 1USD = 415.0 NGN'),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 45,
                  bottom: 10,
                ),
                height: 200,
                width: double.maxFinite,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$0.00',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 70),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LightText(text: 'USD Bal: \$500.00'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 250,
                margin: const EdgeInsets.only(top: 50.0, right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InnerContainer(
                          height: 100,
                          col: Colors.white,
                          data: 5,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "you'll pay",
                                style: kLightTextStyle.copyWith(
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'N40,000.00',
                                style: kLightTextStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                          style: kLightTextStyle),
                      InnerContainer(
                          height: 70,
                          col: Colors.pink,
                          data: 13,
                          widget: Text('Continue',
                              style: kLightTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget LightText({String text}) {
    return Text(
      text,
      style: kLightTextStyle,
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
