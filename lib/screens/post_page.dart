import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
class PostPage extends StatefulWidget {
  const PostPage({ Key? key }) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: darkBlack,
          title: Text(
            "Medium",
            style: headerFont(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          
        ),
    );
  }
}