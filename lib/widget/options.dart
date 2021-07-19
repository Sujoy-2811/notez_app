import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  // const Options({ Key? key }) : super(key: key);
  final Function changeColor;

  Options(this.changeColor);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
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
                    shape: BoxShape.circle, color: Colors.blueGrey),
              ),
            ),
            InkWell(
              onTap: () {
                changeColor(Colors.blue);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {
                changeColor(Colors.orange);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {
                changeColor(Colors.red);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {
                changeColor(Colors.pink);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
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
              style: TextStyle(color: Colors.white, fontSize: 18),
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
              style: TextStyle(color: Colors.white, fontSize: 18),
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
              style: TextStyle(color: Colors.white, fontSize: 18),
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
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
