import 'dart:convert';

class BlogData {
   String text; 
   String pictureUrl; 
   bool archived; 
   String title; 
   bool recentlyViewed; 
   DateTime date; 
   bool mute; 
   bool dismissed; 
   String name; 
   String profilePicture;
  BlogData({
    required this.text,
    required this.pictureUrl,
    required this.archived,
    required this.title,
    required this.recentlyViewed,
    required this.date,
    required this.mute,
    required this.dismissed,
    required this.name,
    required this.profilePicture,
  });


  

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'pictureUrl': pictureUrl,
      'archived': archived,
      'title': title,
      'recentlyViewed': recentlyViewed,
      'date': date.millisecondsSinceEpoch,
      'mute': mute,
      'dismissed': dismissed,
      'name': name,
      'profilePicture': profilePicture,
    };
  }

  factory BlogData.fromMap(Map<String, dynamic> map) {
    return BlogData(
      text: map['text'] ?? '',
      pictureUrl: map['pictureUrl'] ?? '',
      archived: map['archived'] ?? false,
      title: map['title'] ?? '',
      recentlyViewed: map['recentlyViewed'] ?? false,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      mute: map['mute'] ?? false,
      dismissed: map['dismissed'] ?? false,
      name: map['name'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogData.fromJson(String source) => BlogData.fromMap(json.decode(source));
}
