import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/home/savings_pages/create_a_plan.dart';

class StartSavingPage extends StatefulWidget {
  const StartSavingPage({Key key}) : super(key: key);

  @override
  State<StartSavingPage> createState() => _StartSavingPageState();
}

class _StartSavingPageState extends State<StartSavingPage> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              BackButtons(),
              Text(
                'Choose your plan',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 8),
              Text('We have a plan for you that will meet your goals',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CreatAPlan();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 15),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.pink, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Image.asset(
                          "assets/newImages/Credit Card.png",
                          scale: 4,
                        )),
                        Text(
                          'Bitcoin Savings',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Steadily build your wealth in Bitcoin by automation your Bitcoin purchase. You never have to worry about Bitcoin price wings.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
