import 'dart:ui';

import 'package:flutter/material.dart';

// import 'package:flutter/foundation.dart';

class NoteModal {
  int id = 0;
  String title = "";
  String description = "";
  Color color = Colors.blueGrey;

  NoteModal(
      {required this.title, required this.description, required this.color});
  NoteModal.withID(
      {required this.id,
      required this.title,
      required this.description,
      required this.color});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map = {
      "id": id,
      "title": title,
      "description": description,
      "color": color.toString(),
      //todo
    };
    return map;
  }

  NoteModal.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.description = map['description'];
    this.color = Colors.red;
    //todo
  }
}
