import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReusableFooter extends StatelessWidget {
  const ReusableFooter(
      {Key? key,
      required this.text,
      required this.highlightedText,
      required this.routeMethod})
      : super(key: key);
  final String text;
  final routeMethod;
  final String highlightedText;

  @override
  Widget build(BuildContext context) {
    TextStyle richTextStyle = const TextStyle(color: Colors.green);
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(text: text),
      TextSpan(
        text: highlightedText,
        style: richTextStyle,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            routeMethod();
          },
      )
    ]));
  }
}
