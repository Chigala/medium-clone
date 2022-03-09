import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String photoUrl;
  final String name;
  const ProfileContainer({
    required this.name,
    required this.photoUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(photoUrl),
                backgroundColor: Colors.green,
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "View profile",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
