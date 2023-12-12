import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bittsave/controller/profile_screen_controller.dart';
import 'package:bittsave/view/screens/settings_page/paymentDestination.dart';
import 'package:bittsave/view/screens/wallet/amount_to_withdraw.dart';

import '../../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../../home/funding_usd_wallet_page.dart';
import '../../home/savings_pages/myPlans.dart';
import '../paymentDestination.dart';

class WithDrawPaymentOptions extends StatefulWidget {
  const WithDrawPaymentOptions({Key key}) : super(key: key);

  @override
  State<WithDrawPaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<WithDrawPaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<ProfileController>(builder: (profileController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    BackButtons(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Select a Withdrawal destination',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Select the payment channel to which you would like us to send you funds.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (profileController.userInfo.bankAccounts != null && profileController.userInfo.bankAccounts.isNotEmpty)
                      ...bankItems(profileController.userInfo.bankAccounts),
                    if (profileController.userInfo.bankAccounts == null || profileController.userInfo.bankAccounts.isEmpty)
                      Column(
                        children: [
                          SizedBox(height: 60),
                          Center(
                            child: Image.asset(
                              'assets/newImages/Take a Loan 2.png',
                              scale: 0.9,
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              'No payment options',
                              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 7),
                          Center(
                            child: Text(
                              'You have not added any payment options',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(height: 20),
                          newContTap(
                            col: Colors.pink,
                            text: 'Add new account',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentDestination(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  List<Widget> bankItems(List<dynamic> banks) {
    List<Widget> items = [];
    for (var bank in banks) {
      items.add(bankItem(Map<String, dynamic>.from(bank)));
    }

    return items;
  }

  Widget bankItem(Map<String, dynamic> bankInfo) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AmounttoWithdraw(accountType: bankInfo["account_type"].toString()),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.pink, width: 0.8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.person_outline,
              color: Colors.pink,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bankInfo["account_name"],
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${bankInfo["bank_name"]} \n${bankInfo["account_no"]}',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              color: Colors.pink,
              child: Text(
                bankInfo["account_type"].toString(),
                style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Icon(
              Icons.edit_outlined,
              color: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
