import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/wallet/sendBtcTo.dart';
import 'package:bittsave/view/screens/wallet/send_usd_to_friend.dart';

import '../../../util/dimensions.dart';
import '../home/funding_usd_wallet_page.dart';

class SendUsd extends StatefulWidget {
  const SendUsd({Key key}) : super(key: key);

  @override
  State<SendUsd> createState() => _SendUsdState();
}

class _SendUsdState extends State<SendUsd> {
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
                  SizedBox(height: 20),
                  BackButtons(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 10),
                    child: Text(
                      'How do you want to send USD?',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    child: contTap(
                        image: 'assets/image/bitc.png',
                        title: "Send to BTC address",
                        subtitle: 'Send BTC to a wallet address\ndirectly from your USD wallet',
                        scale: 2,
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendBTCto(
                                type: "USD",
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    child: contTap(
                        image: 'assets/image/bits.png',
                        title: "Send to Bittsave User",
                        subtitle: 'Send USD to other bitsave users',
                        scale: 1.5,
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendUsdToFriend(
                                type: "USD",
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget contTap({
    String image,
    String title,
    String subtitle,
    Function ontap,
    double scale,
  }) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Image.asset(
                image,
                scale: scale,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 2),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10, color: Colors.grey),
                  )
                ]),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20)
            ],
          ),
        ),
      ),
    );
  }
}
