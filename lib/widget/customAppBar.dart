import 'package:flutter/material.dart';
import 'package:notez_app/screen/newNote.dart';

class CustomAppBar extends StatelessWidget {
  // final appBarSize;
  // CustomAppBar(this.appBarSize)
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: InputBorder.none,
                icon: Icon(
                  IconData(60667, fontFamily: 'MaterialIcons'),
                  // color: Colors.white,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                // Navigator.of(context).pop();
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.of(context).pushNamed(NewNote.route, arguments: {
                  "title": "",
                  "description": "",
                  "color": Colors.blueGrey,
                  "index": -1
                });
              },
              icon: Icon(Icons.add_box)),
        ],
      ),
    );
  }
}
