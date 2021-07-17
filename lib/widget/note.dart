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
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(top: 2, left: 2, right: 2),
              child: Text(
                "Title",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: noteColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(bottom: 2, left: 2, right: 2),
              child: Text(
                noteText,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ));
  }
}
