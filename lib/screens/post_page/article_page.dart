import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/screens/post_page/clap_container.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

import 'footer.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage(
      {Key? key,
      required this.title,
      required this.url,
      required this.name,
      required this.claps,
      required this.date,
      required this.readNumber})
      : super(key: key);

  final String title;
  final String url;
  final String name;
  final Timestamp date;
  final int readNumber;
  final int claps;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final FocusNode _focusNode = FocusNode();
  QuillController? _controller;

  @override
  void initState() {
    super.initState();
    _loadFromAssets();
    print(" it just started");
  }

  Future<void> _loadFromAssets() async {
    try {
      final doc = Document.fromJson(jsonDecode(widget.title));
      print(jsonDecode(jsonEncode(widget.title)));
      print("this stage is working");
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    } catch (error) {
      print("this is the errror message ${error.toString()}");
      print(" this stage is tying to work a little");
      final doc = Document()..insert(0, 'Empty asset');
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var newJson = json.decode(widget.title);
    ThemeData theme = Theme.of(context);
    // QuillController _controller = QuillController(
    //     document: Document.fromJson(newJson),
    //     selection: const TextSelection.collapsed(offset: 0));

    if (_controller == null) {
      return const Scaffold(
          body: Center(
              child: Text(
        'Loading...',
        style: TextStyle(color: darkBlack),
      )));
    }
    var quillEditor = QuillEditor(
        controller: _controller!,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: _focusNode,
        autoFocus: false,
        readOnly: true,
        placeholder: 'Add content',
        expands: false,
        padding: EdgeInsets.zero,
        customStyles: DefaultStyles(
          sizeSmall: const TextStyle(fontSize: 9),
        ));

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor,
          iconTheme: IconThemeData(color: theme.iconTheme.color)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up_off_alt_outlined), label: "thumbs_up"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ios_share_outlined), label: "share"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_sharp), label: "bookmark"),
          BottomNavigationBarItem(
              icon: Icon(Icons.font_download_sharp), label: "change the font"),
        ],
        iconSize: 26,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        selectedItemColor: theme.bottomAppBarTheme.color,
        unselectedItemColor: const Color.fromARGB(199, 158, 158, 158),
        type: BottomNavigationBarType.fixed,
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderContainer(
                title: widget.title,
                theme: theme,
                url: widget.url,
                name: widget.name,
                date: widget.date,
                readNumber: widget.readNumber),
            Expanded(child: quillEditor),
            ClapContainer(theme: theme, claps: widget.claps),
            Footer(theme: theme, url: widget.url, name: widget.name)
          ],
        ),
      ),
    );
  }
}




// final String title = " Bloc pattern in Flutter Part3";
//   final String url =
//       "https://images.unsplash.com/photo-1644907961094-8852aca773d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80";
//   final  String name = "Chigala Kingsley";
//   final int date = DateTime.now().millisecondsSinceEpoch;
//   final int readNumber = 3;
//   final int claps = 6;