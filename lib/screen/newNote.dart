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
  var selectedColor = Colors.blueGrey;
  var title = TextEditingController();
  var description = TextEditingController();
  Function addNoteData = () {};

  void addNote() {
    if (title == "" || description == "") {
      return;
    }
    var note = NoteModal(
        title: title.text, description: description.text, color: selectedColor);
    addNoteData(note);
    Navigator.of(context).pop();
  }

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
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    // if (routeArgs != null) {
    title.text = routeArgs['title'] as String;
    description.text = routeArgs["description"] as String;
    selectedColor = routeArgs["color"] as MaterialColor;
    print(title);
    // }
    final productData = Provider.of<NotesData>(context);
    addNoteData = productData.addNote;
    final appBar = AppBar(
      title: Text("Add Note"),
      actions: [IconButton(onPressed: addNote, icon: Icon(Icons.save))],
    );
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: appBar,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    appBar.preferredSize.height) *
                0.999,
            child: Column(
              children: [
                Container(
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
                  decoration: BoxDecoration(color: selectedColor),
                  child: TextField(
                    maxLines: 10,
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
                Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: double.infinity,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Options(changeColor),
                    )),
              ],
            ),
          ),
        ));
  }
}
