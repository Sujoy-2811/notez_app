import 'package:flutter/material.dart';
import 'package:notez_app/modal/NotesModal.dart';
import 'package:notez_app/screen/newNote.dart';

class Note extends StatelessWidget {
  // final Color noteColor;
  final NoteModal noteText;

  Note(this.noteText);

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
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewNote.route, arguments: {
              "title": noteText.title,
              "description": noteText.description,
              "color": noteText.color,
              "index": noteText.id
            });
          },
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
                  noteText.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: noteText.color,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.only(bottom: 2, left: 2, right: 2),
                child: Text(
                  noteText.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ));
  }
}
