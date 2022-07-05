import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/settings_page/kyc_two_steps.dart';

import '../../../util/dimensions.dart';
import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';
import '../home/savings_pages/myPlans.dart';

class KYC extends StatefulWidget {
  const KYC({Key key}) : super(key: key);

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('KYC Requirement',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                    child: Text(
                      'Before you start your KYC process, see what is required of you.',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        ContJ(
                            Image.asset(
                              'assets/newImages/User.png',
                              scale: 3,
                            ),
                            'Usd Wallet',
                            'You can have your money settled in USD. Take note of the price changes in Bitcoin.',
                            Colors.pink,
                            Container(
                              padding: EdgeInsets.all(2),
                              child: Text(
                                'Verified',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.pink,
                              ),
                            )),
                        ContJ(
                            Image.asset(
                              'assets/newImages/Table Lamp.png',
                              scale: 3,
                            ),
                            'Document Upload',
                            'You are required to take a photograph of the front or both sides of your government approved ID',
                            Colors.pink,
                            Container(
                              padding: EdgeInsets.all(2),
                              child: Text(
                                ' Not Started',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 10,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.pink, width: 1)),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.pink[50],
                              child: Icon(
                                Icons.check,
                                color: Colors.pink,
                                size: 18,
                              ),
                            ),
                            title: Text(
                              'I here by authorise Bittsave to collect and use my personal information for the purpose of fulfilling regulatory KYC requirements',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: newContTap(
                            col: Colors.pink,
                            text: 'Add new account',
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KycTwoSteps()));
                            },
                          ),
                        ),
                      ],
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

  Widget ContJ(
      Widget widget, String text1, String text2, Color col, Widget child2) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: col, width: 0.8),
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: widget,
        title: Text(
          text1,
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          text2,
          style: TextStyle(fontSize: 11.5),
        ),
        trailing: child2,
      ),
    );
  }

  Widget ContJ2() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.pink, width: 1)),
    );
  }
}
