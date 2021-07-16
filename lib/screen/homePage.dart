import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:notez_app/widget/note.dart';

class MyHomePage extends StatelessWidget {
  static const notes = [
    'sfsefjsliedfjl ljlkj kkljlkjkljk',
    'sfsefjsliedfjl ljlkj kkljlkjkljk  jhgjh kjh hkuhkjhjb jg',
    'sfsefjsliedfjl ljlkj kkljlkjkljj kkljlj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjj kkljlkjkljk gjk jgujhkjh khh ',
    'sfsefjsliedfjl ljlkj kkljlkjkljk gjgkjhkjhj',
    'sfsefjsliedfjl ljlkj kkljlkjkljk gjgkjhkjhj',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => Note(notes[index]),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
        // new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
