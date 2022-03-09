import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/provider/authentication.dart';
import 'package:flutter_blog/screens/home_page.dart';
import 'package:flutter_blog/screens/sign_up_page/sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User account = snapshot.data as User;
          // Provider.of<Auth>(context, listen: false).user = account;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("there was an error"),
            );
          }

          if (snapshot.hasData) {
            return const HomePage();
          }
          return const SignUpPage();
        },
      ),
    );
  }
}
