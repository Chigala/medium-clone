import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../post_page/article_page.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.title,
    required this.article,
    required this.normalText,
    required this.author,
    required this.time,
    this.photoUrl,
    this.readTime = 6,
  }) : super(key: key);

  final String title;
  final String article;
  final TextStyle normalText;
  final String author;
  final DateTime time;
  final int readTime;
  final dynamic photoUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10.0),
      child: Container(
        color: Theme.of(context).backgroundColor,
        height: 180,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                        const SizedBox(height: 10),
                        Text(article,
                            overflow: TextOverflow.ellipsis, style: normalText),
                        const SizedBox(height: 20),
                        Text(author, style: normalText),
                        const SizedBox(height: 10),
                        Text(
                          "$time . $readTime min read",
                          style: normalText,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(photoUrl),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            // Icon(Icons.add_box),
                            InkWell(
                              onTap: () {
                                print("archived button is working");
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete-settings-svgrepo-com.svg',
                                height: 20,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            const SizedBox(width: 20),
                            // Icon(Icons.delete_sharp)
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/archive-svgrepo-com.svg',
                                height: 20,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Divider(color: Theme.of(context).dividerColor)
            ],
          ),
        ),
      ),
    );
  }
}
