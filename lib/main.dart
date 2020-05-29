import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/home/home.dart';

void main() => runApp(IULyricsApp());

class IULyricsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IU Lyrics',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: AlbumList(title: 'IU Lyrics'),
    );
  }
}
