import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_usd_wallet_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'alertPage.dart';

bool _show = false;

class LoanApplication extends StatefulWidget {
  const LoanApplication({Key key}) : super(key: key);

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackGroundColr(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtons(),
                BoldTextTitle(
                  data: 'Apply for a Loan',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Taking out a loan means you can put your plans into action much earlier',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Cont32(
                        title: 'Take a\nLoan',
                        subtitle: 'Borrow money\nto meet your\nneeds',
                        avatar: CircleAvatar(
                          backgroundColor: Colors.pink,
                        ),
                      ),
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Cont32(
                        title: 'Your Loan\nHistory',
                        subtitle:
                            'Monitor and know\nthe status of your\nloan today',
                        avatar: CircleAvatar(
                          backgroundColor: Colors.pink[200],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Text(
                    'Try our loan calculator to get estimates and secure the best option for your needs and wants',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _bottomSheet();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.2, color: Colors.pink),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Loan Calculator',
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _show == false ? Container() : AlertPage(),
      ],
    ));
  }

  Future<dynamic> _bottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Color(0xFF757575),
              child: SingleChildScrollView(
                child: Container(
                  height: 700,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Loan Calculator',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 23),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.pink,
                                radius: 14,
                                child: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFld(kTextField.copyWith(
                        hintText: 'Loan Amount',
                      )),
                      SelectTxt('Select a repayment period'),
                      TextFld(kTextField.copyWith(
                          suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.pink,
                      ))),
                      SelectTxt('Select a loan to value'),
                      TextFld(kTextField.copyWith(
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.pink))),
                      SelectTxt('Select a repayment'),
                      TextFld(kTextField.copyWith(
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.pink))),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _show = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(20)),
                            height: 50,
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              'Calculate Loan',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget AlertPage() {
    if (_show == true) {
      return Container(
        color: Colors.white70,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      BoldTextTitle(
                        data: 'Loan Calculator Result',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Summary from loan calculator',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20),
                      subText('Total Payback'),
                      titleText('\$301.00'),
                      SizedBox(height: 16),
                      subText('Loan Amount'),
                      titleText('\$250.00'),
                      SizedBox(height: 16),
                      subText('Monthly Payback'),
                      titleText('\$300.00'),
                      SizedBox(height: 16),
                      subText('Collateral Volume'),
                      titleText('\$0.93939399 BTC.00'),
                      SizedBox(height: 8),
                      InnerContainer(
                        col: Colors.pink,
                        widget: Text(
                          'Close',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 160,
                right: 20,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _show = false;
                      });
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.clear, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return null;
    }
  }

  Widget titleText(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }

  Widget subText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        '$text',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  Widget TextFld(deco) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: deco,
      ),
    );
  }

  Widget SelectTxt(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  static const kTextField = InputDecoration(
      hintText: 'Choose a value',
      hintStyle: TextStyle(
          color: Colors.pink, fontWeight: FontWeight.w300, fontSize: 16));
}

class Cont32 extends StatelessWidget {
  const Cont32({Key key, this.title, this.subtitle, this.avatar})
      : super(key: key);
  final String title;
  final String subtitle;
  final Widget avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 15),
      child: PhysicalModel(
        elevation: 5,
        color: Colors.white,
        shadowColor: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 0.5, color: Colors.pink)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 14),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 2),
                    child: Text(
                      subtitle,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    avatar,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
