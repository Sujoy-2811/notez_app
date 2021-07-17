import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom) *
          0.08,
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
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
        ],
      ),
    );
  }
}
