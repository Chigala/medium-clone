import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/provider/authentication.dart';
import 'package:flutter_blog/screens/home_page.dart';
import 'package:flutter_blog/services.dart/firebase_authentication.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Data {
  Auth? provider;
  FireBaseAuthentication auth = FireBaseAuthentication();

  Data(BuildContext context) {
    provider = Provider.of<Auth>(context, listen: false);
  }

  List<dynamic> getSignUpItem() {
    return [
      {
        "text": "Sign up with Google",
        "icon": SvgPicture.asset(
          "assets/icons/icons8-google (3).svg",
          fit: BoxFit.contain,
          height: 25,
        ),
        "method": () {
          // provider!.googleLogin();
          auth.signInWithGoogle();
          print("the google sign in process is working");
        }
      },
      {
        "text": "Sign up with Facebook",
        "icon":
            SvgPicture.asset("assets/icons/icons8-facebook.svg", height: 25),
        "method": () {
          print("signing up via facebook");
        }
      },
      {
        "text": "Sign up with email",
        "icon": SvgPicture.asset(
          "assets/icons/email-svgrepo-com (1).svg",
          color: Colors.white,
          height: 25,
        ),
        "method": () {
          print("signing up with email ");
        }
      },
      {
        "text": "Sign up as a Guest",
        "icon": SvgPicture.asset(
          "assets/icons/profile-svgrepo-com.svg",
          color: Colors.white,
        ),
        "method": () {
          print("signing up as guest");
        }
      }
    ];
  }

  List<dynamic> getSignInItems(BuildContext context) {
    return [
      {
        "text": "Sign in with Google",
        "icon": SvgPicture.asset(
          "assets/icons/icons8-google (3).svg",
          height: 25,
        ),
        "method": () {
          print("signing in with google ");
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const HomePage()));
        }
      },
      {
        "text": "Sign in with Facebook",
        "icon":
            SvgPicture.asset("assets/icons/icons8-facebook.svg", height: 25),
        "method": () {
          print("signing up via facebook");
        }
      },
      {
        "text": "Sign in with email",
        "icon": SvgPicture.asset(
          "assets/icons/email-svgrepo-com (1).svg",
          color: Colors.white,
          height: 22,
        ),
        "method": () {
          print("signing up with email ");
        }
      },
      {
        "text": "Sign in with Twitter",
        "icon": SvgPicture.asset(
          "assets/icons/icons8-twitter.svg",
          height: 25,
        ),
        "method": () {
          print("signing up with twitter ");
        }
      },
      {
        "text": "Sign in as a Guest",
        "icon": SvgPicture.asset(
          "assets/icons/profile-svgrepo-com.svg",
          color: Colors.white,
        ),
        "method": () {
          print("signing up as guest");
        }
      }
    ];
  }
}
