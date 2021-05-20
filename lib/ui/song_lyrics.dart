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
  late String currentLanguage;
  late List<String> lyrics;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: widget.song.lyrics.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        lyrics = widget.song.lyrics.values.elementAt(tabController.index);
        currentLanguage = widget.song.lyrics.keys
            .elementAt(tabController.index)
            .toUpperCase();
      });
    });

    // tabController defaults to first set of lyrics
    lyrics = widget.song.lyrics.entries.first.value;
    currentLanguage =
        widget.song.lyrics.keys.elementAt(tabController.index).toUpperCase();
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
        labelStyle: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        tabs: List<Tab>.generate(
          widget.song.lyrics.length,
          (index) {
            String label =
                widget.song.lyrics.keys.elementAt(index).toUpperCase();

            return Tab(
              text: label,
            );
          },
        ),
      ),
      body: _SongLyricsList(
        currentLanguage: currentLanguage,
        lyrics: lyrics,
      ),
    );
  }
}

class _SongLyricsList extends StatelessWidget {
  final String currentLanguage;
  final List<String> lyrics;

  _SongLyricsList({
    Key? key,
    required this.currentLanguage,
    required this.lyrics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lyrics.isEmpty) {
      return ListView(
        children: [
          ListTile(
            title: Text(
              "Sorry, there are no '$currentLanguage' lyrics available for this song yet.",
              style: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        ],
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(lyrics[index]),
        );
      },
      itemCount: lyrics.length,
    );
  }
}
