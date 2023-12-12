import 'package:flutter/material.dart';
import 'package:bittsave/view/screens/home/funding_options/request_from_a_riend/friend_identity.dart';
import 'package:bittsave/view/screens/home/funding_usd_wallet_page.dart';
import 'package:bittsave/view/screens/profile/profile_confirmation.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
                    child: Text('Profile Setting', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Edit your profile details here',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox(height: 30),
                  textCont('First Name', 'Bola'),
                  textCont('Last Name', 'Musa'),
                  textCont('Username', '@johnsam'),
                  textCont('Email Address', 'johnasam@gmail.com'),
                  textCont('Phone', '+234884848484'),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ConfirmationPage();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                            child: Text(
                          'Save changes',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
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
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
