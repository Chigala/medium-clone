import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableSignInHeader extends StatelessWidget {
  const ReusableSignInHeader(
      {Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          title,
          style: GoogleFonts.ptSerif(
            textStyle: Theme.of(context).textTheme.headline1,
          ),
        )
      ],
    );
  }
}
