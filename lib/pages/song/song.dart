import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  final List<dynamic> lyrics;
  final String albumTitle;
  final int albumIndex;
  final String songTitle;
  final int songIndex;
  final List<dynamic> lyricsHan;
  final List<dynamic> lyricsRom;
  final List<dynamic> lyricsEng;

  Song({Key key, this.lyrics, this.albumTitle, this.albumIndex, this.songTitle, this.songIndex, this.lyricsHan, this.lyricsRom, this.lyricsEng})
      : super(key: key);

  Widget _buildRowLyric(List<dynamic> lyrics, int index) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(lyrics[index].toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(songTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: "HAN"),
              Tab(text: "ROM"),
              Tab(text: "ENG"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: lyricsHan == null ? 0 : lyricsHan.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: _buildRowLyric(lyricsHan, index),
                );
              },
            ),
            ListView.builder(
              itemCount: lyricsRom == null ? 0 : lyricsRom.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: _buildRowLyric(lyricsRom, index),
                );
              },
            ),
            ListView.builder(
              itemCount: lyricsEng == null ? 0 : lyricsEng.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: _buildRowLyric(lyricsEng, index),
                );
              },
            ),
          ]
        ),
      )
    );
  }
}