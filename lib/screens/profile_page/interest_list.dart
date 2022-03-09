import "package:flutter/material.dart";

class InterestList extends StatelessWidget {
  const InterestList({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              tileColor: Theme.of(context).listTileTheme.tileColor,
              title: Text(
                items[index]["data"],
                style: Theme.of(context).textTheme.headline4,
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => items[index]["method"]));
                items[index]["method"]();
              },
            ),
            Divider(
              color: Theme.of(context).dividerTheme.color,
              height: 2,
            ), //                           <-- Divider
          ],
        );
      },
    );
  }
}
