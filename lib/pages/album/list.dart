import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/song/song.dart';

class LyricsList extends StatelessWidget {
  final List<dynamic> lyrics;
  final int albumIndex;
  final String coverArt;

  LyricsList({Key key, this.lyrics, this.albumIndex, this.coverArt})
    : super(key: key);

  void _openSong(BuildContext context, String songTitle, List<dynamic> lyricsHan, List<dynamic> lyricsRom, List<dynamic> lyricsEng) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
        Song(
          songTitle: songTitle,
          lyricsHan: lyricsHan,
          lyricsRom: lyricsRom,
          lyricsEng: lyricsEng
        )
      ),
    );
  }

  Widget _buildRowSong(BuildContext context, String songTitle, int songIndex, List<dynamic> lyricsHan, List<dynamic> lyricsRom, List<dynamic> lyricsEng) {
    return InkWell(
      onTap: () => _openSong(context, songTitle, lyricsHan, lyricsRom, lyricsEng),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: new BorderRadius.circular(4.0),
          child: Image.asset(coverArt, width: 52.0, height: 52.0)
        ),
        title: Text(lyrics[albumIndex]['songs'][songIndex]['title'])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lyrics == null ? 0 : lyrics[albumIndex]['songs'].length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: _buildRowSong(
            context,
            lyrics[albumIndex]['songs'][index]['title'],
            index,
            lyrics[albumIndex]['songs'][index]['lyrics']['han'],
            lyrics[albumIndex]['songs'][index]['lyrics']['rom'],
            lyrics[albumIndex]['songs'][index]['lyrics']['eng']
          ),
        );
      },
    );
  }
}