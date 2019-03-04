import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/album/album.dart';

class AlbumList extends StatelessWidget {
  AlbumList({Key key, this.title}) : super(key: key);

  final String title;

  void _openAlbum(BuildContext context, String albumTitle, int albumIndex, String coverArt) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Album(albumTitle: albumTitle, albumIndex: albumIndex, coverArt: coverArt)),
    );
  }

  Widget _buildRow(BuildContext context, String albumTitle, int albumIndex, String coverArt) {
    return Card(
      child: InkWell(
        onTap: () => _openAlbum(context, albumTitle, albumIndex, coverArt),
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
        title: Text(title),
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
                return _buildRow(context, lyrics[index]['album'], index, lyrics[index]['coverArt']);
              },
            );
          },
        ),
      ),
    );
  }
}