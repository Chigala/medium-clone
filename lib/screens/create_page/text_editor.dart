import 'dart:convert';
import 'dart:math';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/provider/store.dart';
import 'package:flutter_blog/screens/create_page/blog_data.dart';
import 'package:flutter_blog/screens/create_page/create_page.dart';
import 'package:flutter_blog/services.dart/crud.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../provider/authentication.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final QuillController _controller = QuillController.basic();
  final _picker = ImagePicker();
  XFile? selectedImage;
  XFile? image;
  String? url;
  CrudMethod crud = CrudMethod();
  final FocusNode _focusNode = FocusNode();
  dynamic copiedFile;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<String?> _imagePicker(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    copiedFile = await file.copy("${appDocDir.path}/${basename(file.path)}");

    return copiedFile.path.toString();
  }

  Future uploadToDb(BuildContext context) async {
    final user = Provider.of<Auth>(context, listen: false).user;
    File file = copiedFile as File;
    var json = jsonEncode(_controller.document.toDelta().toJson());
    var title = jsonEncode(_controller.document.toPlainText());
    Reference imageRef = FirebaseStorage.instance.ref().child("blogImages");
    Reference taskRef = imageRef.child("${getRandomString(9)}.jpg");
// uploaded the image in the text editor and then I send the map to firestore
    try {
      UploadTask task = taskRef.putFile(file);
      await task;
      url = await taskRef.getDownloadURL();
      print("the url is $url");
    } catch (e) {
      debugPrint(e.toString());
    }

    Map<String, dynamic> data = {
      'text': json,
      'pictureUrl': url,
      'archived': false,
      'title': title,
      'recentlyViewed': false,
      'date': DateTime.now(),
      'mute': false,
      'dismissed': false,
      'name': user!.displayName,
      'profilePicture': user.photoURL,
    };

    crud.addUsers(data);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var quillEditor = QuillEditor(
      controller: _controller,
      focusNode: _focusNode,
      scrollController: ScrollController(),
      scrollable: true,
      padding: EdgeInsets.zero,
      autoFocus: false,
      readOnly: false,
      expands: false,
      customStyles: DefaultStyles(color: Colors.white),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: theme.textTheme.headline4!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      )),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            debugPrint("the draft button is working perfectly");
                          },
                          child: Text("draft",
                              style: theme.textTheme.headline4!
                                  .copyWith(fontSize: 20))),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            uploadToDb(context);
                            debugPrint(" the next button is working perfectly");
                          },
                          child: Text(
                            "Next",
                            style: theme.textTheme.headline4!
                                .copyWith(color: Colors.green, fontSize: 20),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: theme.dividerColor,
            ),
            const SizedBox(height: 50),
            Expanded(child: quillEditor),
            QuillToolbar.basic(
              controller: _controller,
              showInlineCode: false,
              showBackgroundColorButton: false,
              showVideoButton: false,
              showRedo: false,
              showUndo: false,
              toolbarIconAlignment: WrapAlignment.start,
              multiRowsDisplay: false,
              showImageButton: true,
              onImagePickCallback: _imagePicker,
              showCameraButton: false,
              // mediaPickSettingSelector: _mediaPickSetting,
              dialogTheme: QuillDialogTheme(),
              showSmallButton: false,
              iconTheme: const QuillIconTheme(
                iconUnselectedColor: darkBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
