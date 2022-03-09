import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusuableSignInH2Text extends StatelessWidget {
  const ReusuableSignInH2Text({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ptSans(fontSize: 40, color: Colors.white),
    );
  }
}
