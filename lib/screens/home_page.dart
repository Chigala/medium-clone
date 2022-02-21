import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/Reading_List.dart';
import 'package:flutter_blog/screens/activity_page.dart';
import 'package:flutter_blog/screens/create_page.dart';
import 'package:flutter_blog/screens/post_page.dart';
import 'package:flutter_blog/screens/profile_page.dart';
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
        
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: darkBlack,
            elevation: 0,
            currentIndex: selectedPage,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: ( index) {
              setState(() {
                selectedPage = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.book), label: "stack"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidPaperPlane), label: "create"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notification_important), label: "activity"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
            ]),
        body: IndexedStack(index: selectedPage, children: screen));
  }
}
