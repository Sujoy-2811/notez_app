import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final noteText;

  Note(this.noteText);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 90.0,
        maxHeight: 200.0,
      ),
      child: Card(
        child: Text(noteText),
      ),
    );
  }
}
