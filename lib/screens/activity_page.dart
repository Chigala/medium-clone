import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
class ActivityPage extends StatefulWidget {
  const ActivityPage({ Key? key }) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: darkBlack,
          title: Text(
            "Activity Page",
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