import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key, required this.color, required this.tabBar})
      : super(key: key);
  final TabBar tabBar;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: tabBar,
      color: color,
    );
  }
}
