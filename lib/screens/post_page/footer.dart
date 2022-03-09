import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.theme,
    required this.url,
    required this.name,
  }) : super(key: key);

  final ThemeData theme;
  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: theme.dividerColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const FractionalOffset(0.26, 0.26),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(url),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("WRITTEN BY", style: theme.textTheme.headline4),
                    const SizedBox(height: 20),
                    Text(
                      name,
                      style: theme.textTheme.headline4,
                    ),
                  ],
                )
              ],
            ),
            Text(
              "Follow",
              style: theme.textTheme.headline4!.copyWith(color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
