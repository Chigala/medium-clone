import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableSignInHeader extends StatelessWidget {
  const ReusableSignInHeader({Key? key, required this.title, this.icon})
      : super(key: key);
  final String title;
  final icon; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
         
          icon,
          color: Colors.grey,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: GoogleFonts.ptSerif(
              color: Colors.white, fontSize: 39, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
