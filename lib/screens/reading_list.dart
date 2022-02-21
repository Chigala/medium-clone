import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
class ReadingList extends StatefulWidget {
  const ReadingList({ Key? key }) : super(key: key);

  @override
  _ReadingListState createState() => _ReadingListState();
}

class _ReadingListState extends State<ReadingList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: darkBlack,
          title: Text(
            "Reading list",
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