import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';

class ThemeStyle {
  static ThemeData themeData(bool isDark, BuildContext context) {
    return ThemeData(
        
        primaryColor: isDark ? Colors.white : Colors.white,
        backgroundColor: isDark ? darkBlack : Colors.white,
        scaffoldBackgroundColor: isDark ? darkBlack : darkBlack,
        dividerColor: isDark ? Colors.white : darkBlack,
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
            color: isDark ? Colors.white : darkBlack,
          )),
          labelColor: isDark ? Colors.white : darkBlack,
          unselectedLabelColor: isDark ? Colors.white : darkBlack,
        ),
        bottomAppBarColor: isDark ? Colors.black : Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: isDark ? Colors.white : darkBlack,
        ),
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        listTileTheme: ListTileThemeData(
          tileColor: isDark ? const Color.fromARGB(213, 0, 0, 0) : Colors.white,
          textColor: isDark ? Colors.white : Colors.black,
        ),
        dividerTheme: DividerThemeData(
          color: isDark ? Colors.white : darkBlack,
        ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isDark ? const ColorScheme.dark() : const ColorScheme.light()),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 39,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w700),
          headline3: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500),
          headline4: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: isDark ? darkBlack : Colors.white,
          elevation: 0.0,
        ));
  }
}
