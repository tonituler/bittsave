import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/wallet/amount_to_withdraw.dart';

import '../home/funding_options/request_from_a_riend/friend_identity.dart';
import '../home/funding_usd_wallet_page.dart';

class WithDrawPaymentDestination extends StatefulWidget {
  const WithDrawPaymentDestination({Key key}) : super(key: key);

  @override
  State<WithDrawPaymentDestination> createState() => _PaymentDestinationState();
}

class _PaymentDestinationState extends State<WithDrawPaymentDestination> {
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
                    child: Text('Select your Payment Destination',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, bottom: 10, top: 5),
                    child: Text(
                      'Bank accounts and mobile money accounts can be found here',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AmounttoWithdraw()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.pink, width: 0.8)),
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
                                'Babalola Anthony',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Sterling Bank plc \n08884848484',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            color: Colors.pink,
                            child: Text(
                              'Naira',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
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
