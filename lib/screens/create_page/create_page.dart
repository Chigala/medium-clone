import 'package:flutter/material.dart';
import 'package:flutter_blog/constants/themes.dart';
import 'package:flutter_blog/provider/store.dart';
import 'package:flutter_blog/screens/create_page/create_box.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDark = Provider.of<Store>(context, listen: false).isdark;
    return Scaffold(
      backgroundColor: isDark ? lightBlack : Colors.white,
      appBar: AppBar(
        backgroundColor: darkBlack,
        title: Text(
          "create",
          style: headerFont(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            isDark
                ? Image.asset(
                    "assets/images/darktypewriter.jpg",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 400,
                  )
                : Image.asset(
                    "assets/images/whitetypewriter.jpg",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 400,
                  ),
            const SizedBox(height: 50),
            CreateBox(size: size, isDark: isDark)
          ],
        ),
      ),
    );
  }
}
