import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/provider/store.dart';
import 'package:flutter_blog/screens/create_page.dart';
import 'package:provider/provider.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 18);
    final isDark = Provider.of<Store>(context, listen: false).isdark;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        backgroundColor: isDark ? darkBlack : Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (BuildContext context) => const CreatePage()));
            },
            child: const Text(
              "Close",
              style: style,
            )),
        actions: [
          InkWell(
              onTap: () {
                debugPrint("the draft button is working perfectly");
              },
              child: const Text("draft", style: style)),
          const SizedBox(width: 5),
          InkWell(
              onTap: () {
                debugPrint(" the next button is working perfectly");
              },
              child: Text(
                "Next",
                style: style.copyWith(color: Colors.green),
              ))
        ],
      ),
    );
  }
}
