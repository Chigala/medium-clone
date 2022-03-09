import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/activity_page/activity_page.dart';
import 'package:flutter_blog/screens/create_page/create_page.dart';
import 'package:flutter_blog/screens/post_page/post_page.dart';
import 'package:flutter_blog/screens/profile_page/profile_page.dart';
import 'package:flutter_blog/screens/reading_page/reading_list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  final screen = [
    const PostPage(),
    const ReadingList(),
    const CreatePage(),
    const ActivityPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 26,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: darkBlack,
            elevation: 0,
            currentIndex: selectedPage,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromARGB(199, 158, 158, 158),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmarks_sharp), label: "stack"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_sharp), label: "create"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "activity"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "profile"),
            ]),
        body: IndexedStack(index: selectedPage, children: screen));
  }
}
