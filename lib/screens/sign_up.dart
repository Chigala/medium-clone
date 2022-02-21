import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/provider/authentication.dart';
import 'package:flutter_blog/screens/signIn.dart';
import 'package:flutter_blog/shared/register_bars.dart';
import 'package:flutter_blog/shared/register_text_data.dart';
import 'package:flutter_blog/shared/sign_in_%20footer.dart';
import 'package:flutter_blog/shared/sign_in_h2.dart';
import 'package:flutter_blog/shared/sign_in_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final Data data =  Data(context);

    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: darkBlack,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ReusableSignInHeader(
                title: "Chigala", icon: FontAwesomeIcons.galacticRepublic),
            const SizedBox(height: 70),
            const ReusuableSignInH2Text(text: "Join Chigala"),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: data.getSignInItem()
                  .map((e) => ReusableBars(
                      icons: e["icon"], text: e["text"], method: e["method"]))
                  .toList(),
            ),
            const SizedBox(height: 20),
            ReusableFooter(
                text: "Already have an account?",
                highlightedText: "sign in ",
                routeMethod: () {
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (BuildContext context) => const SignInPage()));
                })
          ],
        ),
      ),
    );
  }
}
