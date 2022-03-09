import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/post_page/article_page.dart';
import 'package:flutter_blog/services.dart/crud.dart';
import 'package:flutter_blog/shared/theme_styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reading_page/post_widget.dart';
import 'dart:convert';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // final String article =
  //     "I'm a librarian, and throwing away books is a very big crime to me and I can't even keep it ";

  // final String author = "Claire Sewell";
  // final int readTime = 6;
  // final DateTime time = DateTime.now();
  // final String title =
  //     "Weeding is fundamental: On the libraries and throwing away books";

  ThemeStyle themeStyle = ThemeStyle();
  CrudMethod crud = CrudMethod();
  @override
  Widget build(BuildContext context) {
    TextStyle normalText = GoogleFonts.roboto(
        textStyle: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.normal));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Medium",
            style: GoogleFonts.ptSerif(
              textStyle: Theme.of(context).textTheme.headline2,
            ),
          ),
          centerTitle: true,
          leading: Icon(
            Icons.headphones,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                size: 30,
                color: Theme.of(context).iconTheme.color,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Your Daily Read",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const Icon(
                      Icons.notifications_none,
                      color: Colors.green,
                      size: 25,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: crud.blogData,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
                    }
                    return ListView(
                      shrinkWrap: true,
                      primary: false,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ArticlePage(
                                        title: jsonDecode(data["title"]),
                                        url: data["profilePicture"],
                                        name: data["name"],
                                        date: data["date"],
                                        claps: 6,
                                        readNumber: 6,
                                      ))),
                          child: PostWidget(
                            title: jsonDecode(data["title"]),
                            article: jsonDecode(data["title"]),
                            normalText: normalText,
                            author: data["name"],
                            time: (data["date"] as Timestamp).toDate(),
                            photoUrl: data["pictureUrl"],
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
