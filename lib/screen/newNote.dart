import 'package:flutter/material.dart';
import 'package:notez_app/modal/NotesModal.dart';
import 'package:notez_app/provider/notesData.dart';
import 'package:notez_app/widget/options.dart';
import 'package:provider/provider.dart';

class NewNote extends StatefulWidget {
  static const route = 'NewNoteRoute';

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  var firstTime = true;
  var selectedColor = Colors.blueGrey;
  var title = TextEditingController();
  var description = TextEditingController();
  var index = -1;
  Function addNoteData = () {};
  Function deleteNoteData = () {};

  // NotesData final productData ;

  void crateNote(NoteModal note) {}

  void changeColor(MaterialColor color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context).settings.arguments as <String , Object>;
    if (firstTime) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      // // if (routeArgs != null) {
      title.text = routeArgs['title'] as String;
      description.text = routeArgs["description"] as String;
      MaterialColor currentcolor = routeArgs["color"] as MaterialColor;
      selectedColor = currentcolor;
      index = routeArgs["index"] as int;
      firstTime = false;
    }
    // }
    final productData = Provider.of<NotesData>(context, listen: false);

    //delete function
    deleteNoteData = () {
      if (index == -1) {
        print("index $index");
        Navigator.of(context).pop();
      } else {
        productData.deleteNote(context, index);
      }
    };

    addNoteData = productData.addNote;

    void addNote() async {
      print("Index $index");
      if (title.text == "" || description.text == "") {
        return;
      }
      var note = NoteModal.withID(
          id: index,
          title: title.text,
          description: description.text,
          color: selectedColor);
      await addNoteData(note, index);
      Navigator.of(context).pop();
    }

    final appBar = AppBar(
      title: Text("Add Note"),
      actions: [IconButton(onPressed: addNote, icon: Icon(Icons.save))],
    );
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: appBar,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                // height: 500,
                decoration: BoxDecoration(color: selectedColor),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    //border: InputBorder.none,
                  ),
                  style: TextStyle(
                    // debugLabel: "Title",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: title,
                ),
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(color: Colors.black),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(color: selectedColor),
                child: TextField(
                  maxLines: 15,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Description",
                    //border: InputBorder.none,
                  ),
                  style: TextStyle(
                    // debugLabel: "Title",
                    fontSize: 20,
                    // fontWeight: FontWeight.w600,
                  ),
                  controller: description,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                // height: 700,
                decoration: BoxDecoration(color: Colors.black),
                child: Options(changeColor, deleteNoteData),
              ),
            ],
          ),
        ));
  }
}
