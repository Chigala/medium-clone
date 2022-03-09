import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/sign_up_page/sign_up.dart';
import 'package:flutter_blog/screens/sign_up_page/register_bars.dart';
import 'package:flutter_blog/screens/sign_up_page/signUp_data.dart';
import 'package:flutter_blog/screens/sign_in_page/sign_in_%20footer.dart';
import 'package:flutter_blog/screens/sign_in_page/sign_in_h2.dart';
import 'package:flutter_blog/screens/sign_in_page/sign_in_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var data = Data(context);
    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppBar(backgroundColor: darkBlack, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ReusableSignInHeader(
                title: "Medium",
                icon: SvgPicture.asset(
                  "assets/icons/icons8-medium (1).svg",
                  color: Colors.white,
                  height: 50,
                )),
            const SizedBox(height: 70),
            const ReusuableSignInH2Text(text: "Welcome back"),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: data
                  .getSignInItems(context)
                  .map((e) => ReusableBars(
                      icons: e["icon"], text: e["text"], method: e["method"]))
                  .toList(),
            ),
            const SizedBox(height: 20),
            ReusableFooter(
                text: "Don't have an account?",
                highlightedText: "Sign up",
                routeMethod: () {
                  print("chigala");
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (BuildContext context) => const SignUpPage()));
                })
          ],
        ),
      ),
    );
  }
}
