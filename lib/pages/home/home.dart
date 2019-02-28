import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/album/album.dart';

class AlbumList extends StatefulWidget {
  AlbumList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {

  final albums = ['Modern Times', 'Chat-Shire', 'Palette'];

  void _openAlbum(String albumTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Album(albumTitle: albumTitle)),
    );
  }

  Widget _buildRow(String albumTitle) {
    return GestureDetector(
      onTap: () => _openAlbum(albumTitle),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: ListTile(
            title: Text(albumTitle),
          ),
        )
      )
    );
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
          return _buildRow(albums[index]);
        },
      ),
    );
  }
}