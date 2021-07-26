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
      });
    });
    // Future.delayed(const Duration(milliseconds: 500), () {});

    return _notes.reversed.toList();
  }

  List<NoteModal> searchData(String search) {
    if (search == " ") {
      return _notes.reversed.toList();
    }
    return _notes
        .where((element) =>
            element.title.toLowerCase().startsWith(search.toLowerCase()))
        .toList()
        .reversed
        .toList();
  }

  Future<void> addNote(NoteModal notemodal, int index) async {
    final Future<Database> dbFuture = _databaseHelper.initializeDatabase();
    if (index == -1) {
      await dbFuture.then((_) {
        _databaseHelper.getCount().then((value) {
          notemodal.id = null;
          _databaseHelper.insertNote(notemodal);
          getData();
          // notifyListeners();
        });
      });
    } else {
      await dbFuture.then((_) {
        _databaseHelper.updateNote(notemodal);
        getData();
        // notifyListeners();
      });
      // _notes.removeAt(index);
      // _notes.insert(index, notemodal);
    }
    notifyListeners();
    print("Hello\n");
    print(_notes.length);
    print("Hello\n");
  }

  void deleteNote(BuildContext context, int id) async {
    // final Future<Database> dbFuture =
    _databaseHelper.initializeDatabase();
    await _databaseHelper.deleteNote(id);
    await getData();
    notifyListeners();
    Navigator.of(context).pop();
  }
}
