import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final Color noteColor;
  final noteText;

  Note(this.noteText, this.noteColor);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 90.0,
        maxHeight: 200.0,
      ),
      // child: Card(
      //   elevation: 2,
      //   child: Container(child: Text(noteText)),
      // ),
      child: Container(
        decoration: BoxDecoration(
            color: noteColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(2),
        child: Container(child: Text(noteText)),
      ),
    );
  }
}
