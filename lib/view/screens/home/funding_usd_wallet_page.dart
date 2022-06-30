import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:six_cash/app/extensions.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/home/funding_options/fund_bit_express.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/bitsave_user_request.dart';
import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

class FundingUsdWallet extends StatefulWidget {
  const FundingUsdWallet({Key key}) : super(key: key);

  @override
  State<FundingUsdWallet> createState() => _FundingUsdWalletState();
}

class _FundingUsdWalletState extends State<FundingUsdWallet> {
  @override
  Widget build(BuildContext context) {
    return BackGroundColr(
      child: Scaffold(
         appBar: AppBar(
          leading: BackButtons(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: BoldTextTitle(data: 'Funding USD Wallet'),
                ),
                // SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'We have rebranding the methods of depositing USD into your wallet.',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 5, bottom: 40),
                  child: PhysicalModel(
                    elevation: 8,
                    color: Colors.pink,
                    shadowColor: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 180.h,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'USD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              '\$500.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 28.sp,
                              ),
                            ),
                          ),
                          Text(
                            'Your Balance',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                getFunds(
                  widget: Icon(
                    Icons.qr_code,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: "BitXpress",
                  subTitle: 'Fund your USD wallet using our \nexternal partners and assoiciates',
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const FundBitExpress();
                    }));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                getFunds(
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BittSaveUserRequest();
                    }));
                  },
                  widget: Icon(
                    Icons.qr_code,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: 'Request from a friend ',
                  subTitle: 'Fund your USD wallet by requesting\nfund from bitsave users.',
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
  final double fontSize;
  const BoldTextTitle({Key key, this.data, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: fontSize ?? 22),
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
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: ColorResources.primaryColor,
        size: 30,
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
    return ListTile(
      onTap: ontap,
      isThreeLine: true,
      dense: true,
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(10)),
        child: widget,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
      ),
      subtitle: Text(
        subTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT - 1, color: Colors.grey),
      ),
      trailing: Icon(
        CupertinoIcons.forward,
        color: Colors.grey[400],
        size: 28,
      ),
    );
  }
}
