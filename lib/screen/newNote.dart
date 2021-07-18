import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  static const route = 'NewNoteRoute';

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  var selectedColor = Colors.blueGrey;
  void changeColor(MaterialColor color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("Add Note"),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
    );
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: appBar,
        backgroundColor: selectedColor,
        body: SingleChildScrollView(
          child: Form(
              child: Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    appBar.preferredSize.height) *
                0.999,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    //border: InputBorder.none,
                  ),
                  style: TextStyle(
                    // debugLabel: "Title",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
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
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: double.infinity,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  changeColor(Colors.green);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeColor(Colors.blueGrey);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeColor(Colors.blue);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeColor(Colors.orange);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeColor(Colors.red);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeColor(Colors.pink);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.pink),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  )),
                              Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                  )),
                              Text(
                                "Copy to clipboard",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.control_point_duplicate_outlined,
                                    color: Colors.white,
                                  )),
                              Text(
                                "Dupicate Note",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  )),
                              Text(
                                "Delete Note",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )),
        ));
  }
}
