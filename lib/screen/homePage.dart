import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notez_app/provider/notesData.dart';
import 'package:notez_app/widget/customAppBar.dart';

import 'package:notez_app/widget/note.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  // var notes = [
  //   'sfsefjsliedfjl ljlkj kkljlkjkljk',
  //   'sfsefjsliedfjl ljlkj kkljlkjkljk  jhgjh kjh hkuhkjhjb jg',
  //   // 'sfsefjsliedfjl ljlkj kkljlkjkljj kkljlj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjk jgujhkjh khh ',
  //   // 'sfsefjsliedfjl ljlkj kkljlkjkljk gjgkjhkjhj',
  //   // 'sfsefjsliedfjl ljlkj kkljlkjkljk gjgkjhkjhj',
  // ];

  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<NotesData>(context);
    final notes = ProductData.getData();
    print(notes);
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Container(
              // -change heights
              height: 600,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: notes.length,
                itemBuilder: (BuildContext context, int index) =>
                    Note(notes[index], Colors.orange),
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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
