import 'package:flutter/material.dart';
import 'package:iu_lyrics/ui/albums_list.dart';

void main() => runApp(IULyricsApp());

class IULyricsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IU Lyrics',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple,
        cardColor: Colors.deepPurple.shade400,
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Colors.white,
          ),
        ),
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent.shade100,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
        ),
        brightness: Brightness.dark,
      ),
      home: AlbumsList(title: 'IU Lyrics'),
    );
  }
}
