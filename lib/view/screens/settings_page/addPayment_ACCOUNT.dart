import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/view/base/custom_drop_down.dart';
import 'package:six_cash/view/screens/settings_page/accountAddedSuccessfull.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class AddPaymentAccount extends StatefulWidget {
  const AddPaymentAccount({Key key}) : super(key: key);

  @override
  State<AddPaymentAccount> createState() => _AddPaymentAccountState();
}

class _AddPaymentAccountState extends State<AddPaymentAccount> {
  String bank;

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
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Text('Destination Bank Account', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Provide bank account details for easy transfer',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 50),
                  textCont('Account Number', 'Enter account number'),
                  textCont('Account Name', 'Enter account number'),
                  // textCont('Username', '@johnsam'),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 12, top: 20, bottom: 20),
                    child: GetBuilder<SplashController>(builder: (splashController) {
                      return CustomDropDownButton(
                        busy: false,
                        list: splashController.configModel.bankList.map((value) => value["value"].toString()).toList(),
                        onChanged: (value) {
                          bank = value;
                          setState(() {});
                        },
                        title: "Bank Name",
                        hintText: "Select a bank",
                        backgroundColor: Colors.grey[200],
                        bordered: DropDownType.Bordered,
                        value: bank,
                      );
                    }),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountAdded()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Save changes',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textCont(String titleText, String hintText, {TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 12, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titleText',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: '    $hintText',
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
