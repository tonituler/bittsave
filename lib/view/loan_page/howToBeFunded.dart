import 'package:flutter/material.dart';
import 'package:six_cash/view/loan_page/application_succesfful.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';


bool _showDialog = false;
bool _show2ndDialog = false;

class HowToBeFunded extends StatefulWidget {
  const HowToBeFunded({Key key}) : super(key: key);

  @override
  State<HowToBeFunded> createState() => _HowToBeFundedState();
}

class _HowToBeFundedState extends State<HowToBeFunded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundColr(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                BackButtons(),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 60),
                  child: Text(
                    'How do you want to be funded?',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
                getFunds(
                  subTitle:
                      'You will be required to make a Bank\nTransfer to your deposit',
                  title: 'Bank Transfer',
                  ontap: () {
                    setState(() {
                      _showDialog = true;
                    });
                  },
                  widget: Container(
                    child: Image.asset(
                      'assets/newImages/TelegramLogo.png',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                getFunds(
                  subTitle: 'Your USD account will be funded\nvia this method',
                  title: 'Fund USD Wallet',
                  ontap: () {
                    setState(() {
                      _show2ndDialog = true;
                    });
                  },
                  widget: Container(
                    child: Image.asset(
                      'assets/newImages/wallet Icon.png',
                    ),
                  ),
                )
              ],
            ),
          )),
          _showDialog == false ? Container() : AlertDialog(),
          _show2ndDialog == false ? Container() : AlertDialog(),
        ],
      ),
    );
  }

  Widget AlertDialog() {
    if (_show2ndDialog == true) {
      return Container(
        color: Colors.white70,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 450,
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
                        data: 'USD Wallet Confirmation',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Before you confirm, kindly verify the information',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20),
                      subText('Loan Amount'),
                      titleText('N250.00'),
                      SizedBox(height: 16),
                      subText('Transfer fee'),
                      titleText('\$1.00'),
                      SizedBox(height: 16),
                      subText('Payment Amount'),
                      titleText('\$249.00'),
                      SizedBox(height: 4),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _show2ndDialog = false;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ApplicationSuccessful();
                            }));
                          });
                        },
                        child: Container(
                          child: InnerContainer(
                            col: Colors.pink,
                            widget: Text(
                              'Confirm',
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
                top: 130,
                right: 20,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _show2ndDialog = false;
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
    } else if (_showDialog == true) {
      return Container(
        color: Colors.white70,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 450,
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
                        data: 'Bank Transfer Information',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Before you confirm, kindly verify the information',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20),
                      subText('1USD - Naira'),
                      titleText('N565.00'),
                      SizedBox(height: 16),
                      subText('Loan Amount'),
                      titleText('\$250.00'),
                      SizedBox(height: 16),
                      subText('Amount in NGN'),
                      titleText('30,000.00 NGN'),
                      SizedBox(height: 16),
                      subText('Transfer fee'),
                      titleText('500.00 NGN'),
                      SizedBox(height: 16),
                      subText('Payable Amount'),
                      titleText('29,500.00 NGN'),
                      SizedBox(height: 4),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showDialog = false;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ApplicationSuccessful();
                            }));
                          });
                        },
                        child: Container(
                          child: InnerContainer(
                            col: Colors.pink,
                            widget: Text(
                              'Confirm',
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
                top: 130,
                right: 20,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _showDialog = false;
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
}
