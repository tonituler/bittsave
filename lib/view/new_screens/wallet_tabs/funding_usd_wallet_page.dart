import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/fund_bit_express.dart';

class FundingUsdWallet extends StatefulWidget {
  const FundingUsdWallet({Key key}) : super(key: key);

  @override
  State<FundingUsdWallet> createState() => _FundingUsdWalletState();
}

class _FundingUsdWalletState extends State<FundingUsdWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pinkAccent[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtons(),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, top: 20, left: 8),
                  child: BoldTextTitle(data: 'Funding USD Wallet'),
                ),
                // SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 40),
                  child: Text(
                    'We have rebranding the methods of depositing USD into your wallet.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 22),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, right: 20, left: 5, bottom: 80),
                  child: PhysicalModel(
                    elevation: 8,
                    color: Colors.pink,
                    shadowColor: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'USD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w200),
                              ),
                              Spacer(),
                              Text(
                                '\$',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              '\$500.00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 40),
                            ),
                          ),
                          Text(
                            'Your Balance',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                getFunds(
                  icon: Icons.qr_code,
                  title: "BitXpress",
                  subTitle:
                      'Fund your USD wallet using our \nexternal partners and assoiciates',
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FundBitExpress();
                    }));
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                getFunds(
                  icon: Icons.qr_code,
                  title: 'Request from a friend ',
                  subTitle:
                      'Fund your USD wallet by requesting\nfund from bitsave users.',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BoldTextTitle extends StatelessWidget {
  final String data;
  const BoldTextTitle({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),
    );
  }
}

class BackButtons extends StatelessWidget {
  const BackButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.pink,
        size: 30,
      ),
    );
  }
}

class getFunds extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function ontap;
  final IconData icon;
  const getFunds({this.subTitle, this.title, this.ontap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(16)),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  subTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                CupertinoIcons.forward,
                color: Colors.grey[400],
                size: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
