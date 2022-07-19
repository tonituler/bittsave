import 'package:flutter/material.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/base/buttons.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/loan/application_succesfful.dart';

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
                    subTitle: 'You will be required to make a Bank\nTransfer to your deposit',
                    title: 'Bank Transfer',
                    ontap: () {
                      _showBankTransferDialog();
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
                      _showWalletDialog();
                    },
                    widget: Container(
                      child: Image.asset(
                        'assets/newImages/wallet Icon.png',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showBankTransferDialog() {
    Widget widget = Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 520,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border.all(color: Colors.black26, width: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
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
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: buttonWithBorder(
                      'Continue',
                      textColor: Colors.white,
                      buttonColor: ColorResources.primaryColor,
                      fontSize: 18.sp,
                      busy: false,
                      fontWeight: FontWeight.w400,
                      height: 54.h,
                      onTap: () async {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ApplicationSuccessful();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -2,
            right: -2,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
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
    );

    showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          height: 520,
          child: widget,
          color: Colors.transparent,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 0),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _showWalletDialog() {
    Widget widget = Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border.all(color: Colors.black26, width: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
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
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: buttonWithBorder(
                      'Continue',
                      textColor: Colors.white,
                      buttonColor: ColorResources.primaryColor,
                      fontSize: 18.sp,
                      busy: false,
                      fontWeight: FontWeight.w400,
                      height: 54.h,
                      onTap: () async {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ApplicationSuccessful();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -2,
            right: -2,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
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
    );

    showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          height: 430,
          child: widget,
          color: Colors.transparent,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 0),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
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
