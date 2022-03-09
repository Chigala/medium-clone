import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/shared/darkmood_preferences.dart';

class DarkMoodProvider extends ChangeNotifier {
  bool isDark = false;
  DarkMoodPreference darkMoodprefs = DarkMoodPreference();
   
  
  void darkMoodHandler(bool value) {
    isDark = value;
    darkMoodprefs.setDarkMood(value);
    notifyListeners();
    print("the value is $isDark");
  }
}
