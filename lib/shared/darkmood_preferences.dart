import 'package:shared_preferences/shared_preferences.dart';

class DarkMoodPreference {
  static const themeStatus = "themeStatus";

  setDarkMood(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(themeStatus, value);
  }

  Future<bool> getDarkMood() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(themeStatus) ?? true;
  }
}
