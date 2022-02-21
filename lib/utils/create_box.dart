import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/text_editor.dart';

class CreateBox extends StatelessWidget {
  const CreateBox({
    Key? key,
    required this.size,
    required this.isDark,
  }) : super(key: key);

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("ready to write a story is working");
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (BuildContext context) => const TextEditor()));
      },
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: isDark ? Colors.grey.shade800 : Colors.white,
                  spreadRadius: 3.0,
                  blurRadius: 4,
                  offset: const Offset(-10, 10))
            ],
            color: isDark ? darkBlack : Colors.white),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment(0.9, -0.9),
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Write a story",
                      style: TextStyle(
                          color: isDark ? Colors.white : darkBlack,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Medium stories are the easiest \nways to share yourideas with the world",
                          style: TextStyle(
                              color: isDark ? Colors.white : darkBlack,
                              fontSize: 15),
                          maxLines: 3,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
