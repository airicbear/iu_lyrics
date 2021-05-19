import 'package:flutter/material.dart';
import 'package:iu_lyrics/model/song.dart';

class SongLyrics extends StatefulWidget {
  final Song song;

  SongLyrics({Key? key, required this.song}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SongLyricsState();
}

class _SongLyricsState extends State<SongLyrics>
    with SingleTickerProviderStateMixin {
  late List<dynamic> lyrics;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: widget.song.lyrics.allLyrics.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        lyrics =
            widget.song.lyrics.allLyrics.values.toList()[tabController.index];
      });
    });
    lyrics = widget.song.lyrics.allLyrics.entries.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
      ),
      bottomNavigationBar: TabBar(
        controller: tabController,
        labelColor: Theme.of(context).accentColor,
        tabs: List<Tab>.generate(
          widget.song.lyrics.allLyrics.length,
          (index) => Tab(
            text:
                widget.song.lyrics.allLyrics.keys.toList()[index].toUpperCase(),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final String line = lyrics[index];
          return ListTile(
            title: Text(
              line,
            ),
          );
        },
        itemCount: lyrics.length,
      ),
    );
  }
}
