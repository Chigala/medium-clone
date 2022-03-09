import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/reading_page/Highlighted_page.dart';
import 'package:flutter_blog/screens/reading_page/archived_page.dart';
import 'package:flutter_blog/screens/reading_page/recently_viewed_page.dart';
import 'package:flutter_blog/screens/reading_page/saved_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadingList extends StatefulWidget {
  const ReadingList({Key? key}) : super(key: key);

  @override
  _ReadingListState createState() => _ReadingListState();
}

class _ReadingListState extends State<ReadingList> {
  @override
  Widget build(BuildContext context) {
    int  savedValue = 2;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text("Reading list",
                style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headline3)),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    print("this icon is loading");
                  },
                  icon: const Icon(Icons.shuffle))
            ],
            bottom: TabBar(
              // indicatorColor:Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Theme.of(context).tabBarTheme.labelColor,
              unselectedLabelColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
              isScrollable: true,
              indicator:const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0
                )
              ),
              tabs: [
              Tab(text: "saved($savedValue)"),
              const Tab(text: "Archived"),
              const Tab(text: "Recently viewed"),
              const Tab(text: "Highlighted"),
            ])),

            body:const TabBarView(children: [
              SavedPage(),
              ArchivedPage(),
              RecentlyViewedPage(),
              HighlightedPage()
            ]) ,
      ),
    );
  }
}
