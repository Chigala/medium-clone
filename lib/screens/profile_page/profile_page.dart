import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/provider/dark_mood_provider.dart';
import 'package:flutter_blog/screens/authentication.dart';
import 'package:flutter_blog/screens/profile_page/profile_container.dart';
import 'package:flutter_blog/screens/profile_page/settings.dart';
import 'package:flutter_blog/services.dart/firebase_authentication.dart';
import 'package:flutter_blog/shared/darkmood_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/authentication.dart';
import 'interest_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DarkMoodPreference darkmoodPrefs = DarkMoodPreference();
  FireBaseAuthentication auth = FireBaseAuthentication();

  @override
  Widget build(BuildContext context) {
    final user =  Provider.of<Auth>(context, listen: false).user;
    List<Map<String, dynamic>> items = [
      {
        "data": "Series",
        "method": () {
          auth.signOutFromGoogle();
          print("the series is being showed");
        }
      },
      {
        "data": "Stories",
        "method": () {
          print("the stories is being showed");
        }
      },
      {
        "data": "Stats",
        "method": () {
          print("the stats is being showed");
        }
      },
      {
        "data": "Customize your interest ",
        "method": () {
          print("the customize your interest  is being showed");
        }
      },
    ];
    List<Map<String, dynamic>> items2 = [
      {
        "data": "Settings",
        "method": const Settings(),
      },
      {"data": "Help", "method": () {}},
      {
        "data": "Terms of service",
        "method": () {
          print("go home");
        }
      },
      {
        "data": "privacy policy  ",
        "method": () {
          print("privacy policy policy is being showed");
        }
      },
    ];
    final darkmoodSwitch =
        Provider.of<DarkMoodProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: darkBlack,
        title: Text("You",
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: Colors.white))),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ProfileContainer(
              name: user!.displayName!, photoUrl:user.photoURL! ,
            ),
            const SizedBox(
              height: 10,
            ),
            InterestList(items: items),
            const SizedBox(height: 10),
            ListTile(
              tileColor: Theme.of(context).listTileTheme.tileColor,
              leading: Text(
                "Night mode",
                style:
                    TextStyle(color: Theme.of(context).listTileTheme.textColor),
              ),
              trailing: CupertinoSwitch(
                  value: darkmoodSwitch.isDark,
                  onChanged: (value) {
                    setState(() {
                      darkmoodSwitch.darkMoodHandler(value);
                    });
                  }),
            ),
            const SizedBox(height: 10),
            InterestList(items: items2),
          ],
        ),
      ),
    );
  }
}
