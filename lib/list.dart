import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LyricsList extends StatelessWidget {
  final List<dynamic> lyrics;
  LyricsList({Key key, this.lyrics}) : super(key: key);

  Widget _buildRowSong(int index) {
    return InkWell(
      onTap: () {},
      child: new Container(
        child: Text(
          lyrics[index]['songs'][0] + "\n" + lyrics[index]['songs'][1],
        ),
        padding: const EdgeInsets.all(15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: lyrics == null ? 0 : lyrics.length,
        itemBuilder: (BuildContext context, int index) {
          return
            new Card(
              child: _buildRowSong(index),
            );
        });
  }
}