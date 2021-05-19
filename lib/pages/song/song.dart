import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  final String songTitle;
  final List<dynamic> lyricsHan;
  final List<dynamic> lyricsRom;
  final List<dynamic> lyricsEng;

  Song(
      {Key? key,
      required this.songTitle,
      required this.lyricsHan,
      required this.lyricsRom,
      required this.lyricsEng})
      : super(key: key);

  Widget _buildLyrics(List<dynamic> lyrics) {
    return ListView.builder(
      itemCount: lyrics.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(lyrics[index].toString()),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(songTitle),
          ),
          bottomNavigationBar: TabBar(
            labelColor: Theme.of(context).accentColor,
            tabs: [
              Tab(text: "HAN"),
              Tab(text: "ROM"),
              Tab(text: "ENG"),
            ],
          ),
          body: TabBarView(children: [
            _buildLyrics(lyricsHan),
            _buildLyrics(lyricsRom),
            _buildLyrics(lyricsEng),
          ]),
        ));
  }
}
