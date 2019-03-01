import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  final List<dynamic> lyrics;
  final String albumTitle;
  final int albumIndex;
  final String songTitle;
  final int songIndex;
  final List<dynamic> songLyrics;

  Song({Key key, this.lyrics, this.albumTitle, this.albumIndex, this.songTitle, this.songIndex, this.songLyrics})
      : super(key: key);

  Widget _buildRowLyric(int index) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(songLyrics[index].toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songTitle),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: songLyrics.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: _buildRowLyric(index),
            );
          },
        ),
      ),
    );
  }
}