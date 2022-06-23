import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/fund_bit_express.dart';

import '../funding_usd_wallet_page.dart';

class PartnersInformation extends StatefulWidget {
  const PartnersInformation({Key key}) : super(key: key);

  @override
  State<PartnersInformation> createState() => _PartnersInformationState();
}

class _PartnersInformationState extends State<PartnersInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 16),
              child: BackButtons(),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 35),
                child: Text(
                  "Partner's Informaion",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )),
            LText(subtitle: '37,999.00 NGN', title: "amount you'll send"),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "account Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Asaride Peter",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                ],
              ),
            ),
            LText(subtitle: '646464644 - GTBank', title: "bank Transfer"),
            LText(subtitle: '#93939393939', title: "references"),
            SizedBox(
              height: 20,
            ),
            CheckBox(
                text:
                    'Do not put any crypto related reference in the narration or remarks e.g Crypto, BTC, Bittsave.'),
            CheckBox(
                text:
                    'Copy the reference provides and paste it in your narration or remarks.'),
            CheckBox(
                text:
                    "Be sure to confirm that you've   paid the exact amount into the provided payment channel before clicking the button below."),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                  child: Text(
                '29.23s',
                style:
                    TextStyle(color: Colors.pink, fontWeight: FontWeight.w500),
              )),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 10, left: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.pink),
              child: Center(
                child: Text(
                  'Continue Payment',
                  textAlign: TextAlign.center,
                  style: kLightTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget LText({String subtitle, String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.black87),
              ),
              SizedBox(height: 3),
              Text(
                "$subtitle",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.inbox_sharp),
        ],
      ),
    );
  }

  Widget CheckBox({String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 13,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
          backgroundColor: Colors.pink,
        ),
        title: Text(
          '$text',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
