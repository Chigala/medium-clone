import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";


class CrudMethod {

   final Stream<QuerySnapshot> blogData = FirebaseFirestore.instance.collection('Blog').snapshots();
  Future addUsers(user) async {
    CollectionReference blog = FirebaseFirestore.instance.collection('Blog');
    return blog
        .add(user)
        .then((value) => debugPrint("successfully added users"))
        .catchError((onError) =>  debugPrint("there was an error:$onError"));
  }

  
}
