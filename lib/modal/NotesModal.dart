import 'dart:ui';

import 'package:flutter/material.dart';

// import 'package:flutter/foundation.dart';

class NoteModal {
  int id = 0;
  String title = "";
  String description = "";
  MaterialColor color = Colors.blueGrey;

  NoteModal(
      {required this.title, required this.description, required this.color});
  NoteModal.withID(
      {required this.id,
      required this.title,
      required this.description,
      required this.color});

  String colorToString(MaterialColor color) {
    if (color.toString() == Colors.green.toString()) return "green";
    if (color.toString() == Colors.blueGrey.toString()) return "blueGrey";
    if (color.toString() == Colors.blue.toString()) return "blue";
    if (color.toString() == Colors.orange.toString()) return "orange";
    if (color.toString() == Colors.red.toString()) return "red";
    if (color.toString() == Colors.pink.toString()) return "pink";
    return "amber";
  }

  MaterialColor stringToColor(String color) {
    if (color == Colors.green.toString()) return Colors.green;
    if (color == Colors.blueGrey.toString()) return Colors.blueGrey;
    if (color == Colors.blue.toString()) return Colors.blue;
    if (color == Colors.orange.toString()) return Colors.orange;
    if (color == Colors.red.toString()) return Colors.red;
    if (color == Colors.pink.toString()) return Colors.pink;
    return Colors.amber;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map = {
      "id": id,
      "title": title,
      "description": description,
      "color": colorToString(color),
      //todo
    };
    return map;
  }

  NoteModal.fromMap(Map<String, dynamic> map) {
    print('hi');
    this.id = map['id'];
    this.title = map['title'];
    this.description = map['description'];
    this.color = Colors.amber;
  }
}
