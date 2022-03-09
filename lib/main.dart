import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/provider/dark_mood_provider.dart';
import 'package:flutter_blog/provider/store.dart';
import 'package:flutter_blog/screens/authentication.dart';
import 'package:flutter_blog/provider/authentication.dart';
import 'package:flutter_blog/shared/darkmood_preferences.dart';
import 'package:flutter_blog/shared/theme_styles.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // DarkMoodProvider darkMoodProvider = DarkMoodProvider();
  Future prefs = DarkMoodPreference().getDarkMood();

  @override
  void initState() {
    super.initState();
    getDarkMood();
  }

  getDarkMood() async {
    // Provider.of<DarkMoodProvider>(context, listen: false).isDark = await prefs;
    print("getMood is working");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Store()),
        ChangeNotifierProvider.value(value: DarkMoodProvider())
      ],
      child: Consumer<DarkMoodProvider>(builder: (context, store, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeStyle.themeData(store.isDark, context),
          home: const Authentication(),
        );
      }),
    );
  }
}
