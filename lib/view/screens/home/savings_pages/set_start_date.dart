import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/savings_pages/choos_payment_source.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SetStartDate extends StatefulWidget {
  const SetStartDate({Key key}) : super(key: key);

  @override
  State<SetStartDate> createState() => _SetStartDateState();
}

class _SetStartDateState extends State<SetStartDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtons(),
              Text('Set a Start date',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22)),
              SizedBox(height: 8),
              Text('When would like to start saving this amount?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              SizedBox(height: 100),
              TextField(
                decoration: InputDecoration(
                    hintText: '     June 26, 2022',
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.pink,
                      size: 25,
                    ),
                    hintStyle: TextStyle(color: Colors.pink, fontSize: 15)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: newContTap(
                  col: Colors.pink,
                  text: 'Proceed to Payment',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoosePayMentSource()));
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
