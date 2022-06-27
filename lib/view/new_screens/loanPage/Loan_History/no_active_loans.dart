import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/loanPage/Loan_History/active_loans.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/friend_identity.dart';

import '../../wallet_tabs/funding_usd_wallet_page.dart';

bool _showBtSheet = false;
bool _show = false;
const kTextField = InputDecoration(
    hintText: 'Choose a value',
    hintStyle: TextStyle(
        color: Colors.pink, fontWeight: FontWeight.w300, fontSize: 16));

class NoActiveLoans extends StatefulWidget {
  const NoActiveLoans({Key key}) : super(key: key);

  @override
  State<NoActiveLoans> createState() => _NoActiveLoansState();
}

class _NoActiveLoansState extends State<NoActiveLoans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: bottomSheet(),
        body: Stack(
          children: [
            BackGroundColr(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BackButtons(),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ActiveLoans();
                              }));
                            },
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.check,
                                    color: Colors.pink, size: 20)))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27.0, bottom: 18),
                      child: Center(
                          child: Image.asset(
                        'assets/newImages/Take a Loan.png',
                        width: 130,
                        scale: 0.5,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Center(
                        child: Text(
                          'No active loans',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Text(
                          'You have not applied for a loan, but thats about to change. Tap the button below',
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: InnerContainer(
                        col: Colors.pink,
                        widget: Text(
                          'Apply for a Loan ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Text(
                      'Try our loan calculator to get estimates and secure the best option for your needs and wants',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _showBtSheet = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          'Loan Calculator',
                          style: TextStyle(color: Colors.pink),
                        )),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.pink[300], width: 0.5),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
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

  Widget bottomSheet() {
    if (_showBtSheet) {
      return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
                color: Colors.grey[50],
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.48,
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
                          InkWell(
                            onTap: () {
                              // Navigator.pop(context);
                              setState(() {
                                _showBtSheet = false;
                              });
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
                            _showBtSheet = false;
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
                ));
          });
    } else {
      return null;
    }
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
                      border: Border.all(color: Colors.black26, width: 0.2),
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            _show = false;
                          });
                        },
                        child: Container(
                          child: InnerContainer(
                            col: Colors.pink,
                            widget: Text(
                              'Close',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
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
}
