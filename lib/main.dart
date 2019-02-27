import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(IULyricsApp());

class IULyricsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IU Lyrics',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.black
      ),
      home: Albums(title: 'IU Lyrics'),
    );
  }
}

class Albums extends StatefulWidget {
  Albums({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {

  final albums = ['Modern Times', 'Chat-Shire', 'Palette'];

  final Random _random = new Random();
  List<Color> _colors = [Colors.orange, Colors.orange, Colors.orange];

  void _changeColor() {
    setState(() {
      for (var i = 0; i < _colors.length; i++) {
        _colors[i] = new Color.fromRGBO(_random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: _changeColor,
            child: Card(
              child: ListTile(
                title: Text(albums[index]),
              ),
              color: _colors[index],
            )
          );
        },
      ),
    );
  }
}
