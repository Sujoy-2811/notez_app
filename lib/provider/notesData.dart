import 'package:flutter/material.dart';
import 'package:notez_app/modal/NotesModal.dart';

class NotesData with ChangeNotifier {
  var _notes = [
    NoteModal(
        title: "hello1", description: "fgdfgbdfxbgfxcbgf", color: Colors.grey),
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

  void addNote(NoteModal notemodal, int index) {
    if (index == -1) {
      _notes.insert(0, notemodal);
    } else {
      _notes.removeAt(index);
      _notes.insert(index, notemodal);
    }
    notifyListeners();
  }
}
