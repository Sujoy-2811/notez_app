import 'package:flutter/material.dart';
import 'package:notez_app/modal/NotesModal.dart';

class NotesData with ChangeNotifier {
  var _notes = [
    NoteModal(
        title: "hello", description: "fgdfgbdfxbgfxcbgf", color: Colors.amber),
    NoteModal(
        title: "hello", description: "fgdfgbdfxbgfxcbgf", color: Colors.amber),
    NoteModal(
        title: "hello", description: "fgdfgbdfxbgfxcbgf", color: Colors.amber),
    NoteModal(
        title: "hello", description: "fgdfgbdfxbgfxcbgf", color: Colors.amber),
    NoteModal(
        title: "hello", description: "fgdfgbdfxbgfxcbgf", color: Colors.amber),
    NoteModal(
        title: "hello", description: "fgdfgbdfxbgfxcbgf", color: Colors.amber),
    NoteModal(
        title: "Hi", description: "fgdfgbdfxbgfxcbgf", color: Colors.amber),
  ];

  List<NoteModal> getData() {
    return _notes;
  }

  void addNote(NoteModal nodemodal) {
    _notes.insert(0, nodemodal);
    notifyListeners();
  }
}
