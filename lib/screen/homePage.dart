import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notez_app/modal/NotesModal.dart';
import 'package:notez_app/provider/notesData.dart';
import 'package:notez_app/screen/newNote.dart';
import 'package:notez_app/widget/customAppBar.dart';

import 'package:notez_app/widget/note.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool firstTime = true;
  List<NoteModal> notes = [
    //   NoteModal.withID(
    //       id: 0,
    //       title: "hello1",
    //       description: "fgdfgbdfxbgfxcbgf",
    //       color: Colors.grey),
  ];
  @override
  Widget build(BuildContext context) {
    // ];
    final appBar = AppBar(
      title: Text("NoteZ"),
    );
    final appBarSize = appBar.preferredSize.height;

    final productData = Provider.of<NotesData>(context, listen: true);
    void search(String search) {
      print(search);
      setState(() {
        notes = productData.searchData(search);
      });
      // print(notes[0].title);
    }

    if (firstTime) {
      productData.getData().then((value) {
        setState(() {
          notes = value;
        });
      });
    }

    // if (firstTime) {
    //   productData.getData().then((value) {
    //     setState(() {
    //       notes = value;
    //     });
    //   }).then((value) {
    //     Future.delayed(const Duration(milliseconds: 500), () {
    //       search("");
    //     });
    //   });
    //   firstTime = false;
    // }

    // print(notes);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: CustomAppBar(search),
              height: (MediaQuery.of(context).size.height -
                      appBarSize -
                      MediaQuery.of(context).padding.top) *
                  0.08,
            ),
            Container(
              // -change heights
              height: (MediaQuery.of(context).size.height -
                      appBarSize -
                      MediaQuery.of(context).padding.top) *
                  0.91,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: notes.length,
                itemBuilder: (BuildContext context, int index) =>
                    Note(notes[index]),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                // new StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NewNote.route, arguments: {
            "title": "",
            "description": "",
            "color": Colors.blueGrey,
            "index": -1
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
