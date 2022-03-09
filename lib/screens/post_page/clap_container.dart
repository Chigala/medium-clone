import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClapContainer extends StatelessWidget {
  const ClapContainer({
    Key? key,
    required this.theme,
    required this.claps,
  }) : super(key: key);

  final ThemeData theme;
  final int claps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: theme.dividerColor),
                top: BorderSide(color: theme.dividerColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.thumb_up_sharp,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("$claps Claps")
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.ios_share_sharp),
                SizedBox(width: 20),
                Icon(Icons.bookmark)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key? key,
    required this.title,
    required this.theme,
    required this.url,
    required this.name,
    required this.date,
    required this.readNumber,
  }) : super(key: key);

  final String title;
  final ThemeData theme;
  final String url;
  final String name;
  final Timestamp date;
  final int readNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(json.decode(json.encode(title)),
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headline2!.copyWith(fontSize: 27)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(url),
                ),
                Text(name, style: theme.textTheme.headline4),
                Text("$date", style: theme.textTheme.headline4),
                Text("$readNumber min read", style: theme.textTheme.headline4),
              ],
            )
          ],
        ),
      ),
    );
  }
}
