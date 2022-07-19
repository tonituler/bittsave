import 'package:flutter/material.dart';
import 'package:six_cash/view/screens/home/funding_usd_wallet_page.dart';
import 'package:six_cash/view/screens/settings_page/kyc_confirmation.dart';

class KycScan extends StatefulWidget {
  const KycScan({Key key}) : super(key: key);

  @override
  State<KycScan> createState() => _KycScanState();
}

class _KycScanState extends State<KycScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  BackButtons(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 10),
                    child: Image.asset('assets/newImages/flashIcon.png'),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Text('KYC-Step Two',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Let us know your location as it reflect on your proof of Identification',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 10, right: 10),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      'Scan your passport or driver license',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KYConfirmation()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 12),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            'Return to dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
