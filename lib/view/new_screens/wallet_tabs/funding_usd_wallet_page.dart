import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/fund_bit_express.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/friend_identity.dart';

class FundingUsdWallet extends StatefulWidget {
  const FundingUsdWallet({Key key}) : super(key: key);

  @override
  State<FundingUsdWallet> createState() => _FundingUsdWalletState();
}

class _FundingUsdWalletState extends State<FundingUsdWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundColr(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtons(),
                  BoldTextTitle(data: 'Funding USD Wallet'),
                  // SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 30),
                    child: Text(
                      'We have rebranding the methods of depositing USD into your wallet.',
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.5),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 5, bottom: 50),
                    child: PhysicalModel(
                      elevation: 10,
                      color: Colors.pink,
                      shadowColor: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        height: 160,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'USD',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200),
                                ),
                                Spacer(),
                                Text(
                                  '\$',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                '\$500.00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              ),
                            ),
                            Text(
                              'Your Balance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  getFunds(
                    widget: Container(
                      child: Image.asset('assets/newImages/Plus in a box.png'),
                    ),
                    title: "BitXpress",
                    subTitle:
                        'Fund your USD wallet using our \nexternal partners and assoiciates.',
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FundBitExpress();
                      }));
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  getFunds(
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BittSaveUserRequest();
                      }));
                    },
                    widget: Container(
                      child: Image.asset('assets/newImages/Plus in a box.png'),
                    ),
                    title: 'Request from a friend ',
                    subTitle:
                        'Fund your USD wallet by requesting\nfund from bitsave users.',
                  )
                ],
              ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 8, top: 8),
      child: Text(
        data,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
      ),
    );
  }
}

class BackButtons extends StatelessWidget {
  const BackButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 20,
          width: 20,
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.pink,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class getFunds extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function ontap;
  final Widget widget;
  const getFunds({this.subTitle, this.title, this.ontap, this.widget});

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
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(12)),
                child: widget,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  subTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
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
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
