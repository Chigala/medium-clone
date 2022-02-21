import 'package:flutter/material.dart';
import 'package:flutter_blog/provider/authentication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Data {
  Auth? provider;

  Data(BuildContext context) {
    provider = Provider.of<Auth>(context, listen: false);
  }

  List<dynamic> getSignInItem() {
    return [
      {
        "text": "Sign up with Google",
        "icon": const Icon(
          FontAwesomeIcons.google,
          color: Colors.red,
          size: 20,
        ),
        "method": () {
          provider!.googleLogin();
          print("the google sign in process is working");
        }
      },
      {
        "text": "Sign up with Facebook",
        "icon":
            const Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 20),
        "method": () {
          print("signing up via facebook");
        }
      },
      {
        "text": "Sign up with email",
        "icon": const Icon(FontAwesomeIcons.envelope,
            color: Colors.white, size: 20),
        "method": () {
          print("signing up with email ");
        }
      },
      {
        "text": "Sign up as a Guest",
        "icon":
            const Icon(FontAwesomeIcons.user, color: Colors.white, size: 20),
        "method": () {
          print("signing up as guest");
        }
      }
    ];
  }

  List text2 = [
    {
      "text": "Sign in with Google",
      "icon": const Icon(
        FontAwesomeIcons.google,
        color: Colors.red,
        size: 20,
      ),
      "method": () {
        print("signing up with google");
      }
    },
    {
      "text": "Sign in with Facebook",
      "icon":
          const Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 20),
      "method": () {
        print("signing up via facebook");
      }
    },
    {
      "text": "Sign in with email",
      "icon":
          const Icon(FontAwesomeIcons.envelope, color: Colors.white, size: 20),
      "method": () {
        print("signing up with email ");
      }
    },
    {
      "text": "Sign in with Twitter",
      "icon":
          const Icon(FontAwesomeIcons.twitter, color: Colors.blue, size: 20),
      "method": () {
        print("signing up with twitter ");
      }
    },
    {
      "text": "Sign in as a Guest",
      "icon": const Icon(FontAwesomeIcons.user, color: Colors.white, size: 20),
      "method": () {
        print("signing up as guest");
      }
    }
  ];
}
