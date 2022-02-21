import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusuableSignInH2Text extends StatelessWidget {
  const ReusuableSignInH2Text({Key? key, required this.text}) : super(key: key);
  final String text; 

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ptSerif(fontSize: 30, color: Colors.white),
    );
  }
}
