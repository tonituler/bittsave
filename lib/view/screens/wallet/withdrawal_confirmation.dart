import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/wallet/usd_withdrawal_confirmation.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class WitdrawalConfirmation extends StatefulWidget {
  const WitdrawalConfirmation({Key key}) : super(key: key);

  @override
  State<WitdrawalConfirmation> createState() => _WitdrawalConfirmationState();
}

class _WitdrawalConfirmationState extends State<WitdrawalConfirmation> {
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
                    padding: const EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('Transfer Confirmation',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '37,900.00 USD',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Total Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '4,999 USD',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Fees',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '500',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Total Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '4,999 USD',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'id',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'asdlknahsdkjahsdkjad',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UsdWithdrawalConfirmation()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 12),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                            child: Text(
                          'Confirm Request',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(8)),
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
}
