import 'package:flutter/material.dart';
import 'package:notez_app/provider/notesData.dart';
import 'package:provider/provider.dart';
import './screen/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesData(),
      child: MaterialApp(
        title: 'NoteZ',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
