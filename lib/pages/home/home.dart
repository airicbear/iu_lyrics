import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/album/album.dart';

class AlbumList extends StatefulWidget {
  AlbumList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {

  void _openAlbum(String albumTitle, int albumIndex, String coverArt) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Album(albumTitle: albumTitle, albumIndex: albumIndex, coverArt: coverArt)),
    );
  }

  Widget _buildRow(String albumTitle, int albumIndex, String coverArt) {
    return Card(
      child: InkWell(
        onTap: () => _openAlbum(albumTitle, albumIndex, coverArt),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: new BorderRadius.circular(4.0),
            child: Image.asset(coverArt, width: 52.0, height: 52.0)
          ),
          title: Text(albumTitle),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle
              .of(context)
              .loadString('assets/iu.json'),
          builder: (context, snapshot) {
            var lyrics = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: lyrics == null ? 0 : lyrics.length,
              itemBuilder: (context, index) {
                return _buildRow(lyrics[index]['album'], index, lyrics[index]['coverArt']);
              },
            );
          },
        ),
      ),
    );
  }
}