import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/sign_in_page/signIn.dart';
import 'package:flutter_blog/screens/sign_up_page/register_bars.dart';
import 'package:flutter_blog/screens/sign_up_page/signUp_data.dart';
import 'package:flutter_blog/screens/sign_in_page/sign_in_%20footer.dart';
import 'package:flutter_blog/screens/sign_in_page/sign_in_h2.dart';
import 'package:flutter_blog/screens/sign_in_page/sign_in_header.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final Data data = Data(context);

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


            ReusableSignInHeader(
                title: "Medium",
                icon: SvgPicture.asset(
                  "assets/icons/icons8-medium (1).svg",
                  color: Colors.white,
                  height: 50,
                )),


            const SizedBox(height: 70),

            
            const ReusuableSignInH2Text(text: "Join Medium"),


            const SizedBox(
              height: 20,
            ),



            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: data
                  .getSignUpItem()
                  .map((e) => ReusableBars(
                      icons: e["icon"], text: e["text"], method: e["method"]))
                  .toList(),
            ),
            const SizedBox(height: 20),


            ReusableFooter(
                text: "Already have an account? ",
                highlightedText: "Sign in. ",
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
