// import 'package:flutter/material.dart';
// import 'package:six_cash/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';

// import '../home/funding_usd_wallet_page.dart';

// class NotificationScreens extends StatefulWidget {
//   const NotificationScreens({Key key}) : super(key: key);

//   @override
//   State<NotificationScreens> createState() => _NotificationScreensState();
// }

// class _NotificationScreensState extends State<NotificationScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BackGroundColr(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BackButtons(),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: Text('Notification',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700, fontSize: 20)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0, bottom: 10),
//                     child: Text(
//                       'Hi, Bittsave have some messages for you',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
//                     padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//                     color: Colors.white,
//                     child: getFunds(
//                       widget:
//                           Image.asset('assets/newImages/ telegram iIcon.png'),
//                       title: "Best Offer",
//                       subTitle:
//                           'You will be required to make a\nBank Transfer to your deposit',
//                       ontap: () {},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
