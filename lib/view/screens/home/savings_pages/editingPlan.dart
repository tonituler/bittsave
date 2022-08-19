import 'package:flutter/material.dart';

import '../../wallet/widget/confirm_friendIdentity.dart';
import '../funding_usd_wallet_page.dart';

class EditPlan extends StatefulWidget {
  const EditPlan({Key key}) : super(key: key);

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {
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
                    child: Text('Edit Plan',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Let us know your location as it reflect on your proof of identification',
                      style: TextStyle(color: Colors.grey[800], fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 50),
                  textCont('Plan name', 'My Rent'),
                  textCont('Amount', '20'),
                  textCont2(
                      "Frequency",
                      "Daily",
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.pink,
                        size: 22,
                      )),
                  textCont2(
                      "Credit",
                      "Usd Wallet",
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.pink,
                        size: 22,
                      )),
                  textCont2(
                      "Auto Invest",
                      "Yes",
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.pink,
                        size: 22,
                      )),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Container();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 12),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                            child: Text(
                          'Save Plan',
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

  Widget textCont(String titleText, String hintText) {
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
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: '    $hintText',
                contentPadding: EdgeInsets.symmetric(vertical: 4),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget textCont2(String titleText, String hintText, Icon icon) {
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
            decoration: InputDecoration(
                filled: true,
                suffixIcon: icon,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 4),
                hintText: '    $hintText',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
