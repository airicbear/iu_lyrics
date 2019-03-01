import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/song/song.dart';

class LyricsList extends StatefulWidget {
  final List<dynamic> lyrics;
  final String albumTitle;
  final int albumIndex;
  final String coverArt;

  LyricsList({Key key, this.lyrics, this.albumTitle, this.albumIndex, this.coverArt})
    : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LyricsListState();
  }
}

class _LyricsListState extends State<LyricsList> {

  void _openSong(String songTitle, int songIndex, List<dynamic> lyricsHan, List<dynamic> lyricsRom, List<dynamic> lyricsEng) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
        Song(
          albumTitle: widget.albumTitle,
          albumIndex: widget.albumIndex,
          songTitle: songTitle,
          songIndex: songIndex,
          lyricsHan: lyricsHan,
          lyricsRom: lyricsRom,
          lyricsEng: lyricsEng
        )
      ),
    );
  }

  Widget _buildRowSong(String songTitle, int songIndex, List<dynamic> lyricsHan, List<dynamic> lyricsRom, List<dynamic> lyricsEng) {
    return InkWell(
      onTap: () => _openSong(songTitle, songIndex, lyricsHan, lyricsRom, lyricsEng),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: new BorderRadius.circular(4.0),
          child: Image.asset(widget.coverArt , width: 52.0, height: 52.0)
        ),
        title: Text(widget.lyrics[widget.albumIndex]['songs'][songIndex]['title'])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lyrics[widget.albumIndex]['songs'] == null ? 0 : widget.lyrics[widget.albumIndex]['songs'].length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: _buildRowSong(
            widget.lyrics[widget.albumIndex]['songs'][index]['title'],
            index,
            widget.lyrics[widget.albumIndex]['songs'][index]['lyrics']['han'],
            widget.lyrics[widget.albumIndex]['songs'][index]['lyrics']['rom'],
            widget.lyrics[widget.albumIndex]['songs'][index]['lyrics']['eng']
          ),
        );
      },
    );
  }
}