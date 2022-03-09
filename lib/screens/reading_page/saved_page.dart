import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/reading_page/post_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final String article =
      "I'm a librarian, and throwing away books is a very big crime to me and I can't even keep it ";

  final String author = "Claire Sewell";
  final int readTime = 6;
  final DateTime time = DateTime.now();
  final String title =
      "Weeding is fundamental: On the libraries and throwing away books";

  @override
  Widget build(BuildContext context) {
    TextStyle normalText = GoogleFonts.roboto(
        textStyle: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.normal));
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            PostWidget(
              title: title,
              article: article,
              normalText: normalText,
              author: author,
              time: time,
              readTime: readTime,
              photoUrl:
                  "https://images.unsplash.com/photo-1644907961094-8852aca773d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
            ),
            PostWidget(
              title: title,
              article: article,
              normalText: normalText,
              author: author,
              time: time,
              readTime: readTime,
              photoUrl:
                  "https://images.unsplash.com/photo-1644907961094-8852aca773d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
            ),
            PostWidget(
              title: title,
              article: article,
              normalText: normalText,
              author: author,
              time: time,
              readTime: readTime,
              photoUrl:
                  "https://images.unsplash.com/photo-1644907961094-8852aca773d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
            ),
           
          ],
        ),
      ),
    );
  }
}
