import 'package:flutter/material.dart';
import 'package:notez_app/modal/NotesModal.dart';
import 'package:notez_app/utils/notesDatabaseHelper.dart';
import 'package:sqflite/sqlite_api.dart';

class NotesData with ChangeNotifier {
  final _databaseHelper = NoteDatabaseHelper();
  List<NoteModal> _notes = [
    // NoteModal.withID(
    //     id: 0,
    //     title: "hello1",
    //     description: "fgdfgbdfxbgfxcbgf",
    //     color: Colors.grey),
  ];

  Future<List<NoteModal>> getData() async {
    final Future<Database> dbFuture = _databaseHelper.initializeDatabase();
    await dbFuture.then((database) {
      Future<List<NoteModal>> noteListFuture = _databaseHelper.getNoteList();
      noteListFuture.then((value) {
        this._notes = value;
        notifyListeners();
        print("123");
      });
    });

    // Future.delayed(const Duration(milliseconds: 500), () {});

    return _notes;
  }

  List<NoteModal> searchData(String search) {
    if (search == " ") {
      return _notes;
    }
    return _notes
        .where((element) =>
            element.title.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
  }

  void addNote(NoteModal notemodal, int index) async {
    final Future<Database> dbFuture = _databaseHelper.initializeDatabase();
    if (index == -1) {
      await dbFuture.then((Database) {
        _databaseHelper.getCount().then((value) {
          notemodal.id = value;
          _databaseHelper.insertNote(notemodal);
          getData();
          notifyListeners();
        });
      });
    } else {
      await dbFuture.then((database) {
        _databaseHelper.updateNote(notemodal);
        getData();
        notifyListeners();
      });
      // _notes.removeAt(index);
      // _notes.insert(index, notemodal);
    }
    notifyListeners();
    print("Hello\n");
    print(_notes.length);
    print("Hello\n");
  }
}
