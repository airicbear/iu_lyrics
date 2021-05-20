import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iu_lyrics/model/album.dart';
import 'package:iu_lyrics/ui/album_songs.dart';

class AlbumList extends StatelessWidget {
  AlbumList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/iu.json'),
          builder: (context, snapshot) {
            var lyrics = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: lyrics == null ? 0 : lyrics.length,
              itemBuilder: (context, index) {
                return _AlbumListRow(
                  album: Album.fromJson(lyrics[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _AlbumListRow extends StatelessWidget {
  final Album album;

  const _AlbumListRow({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlbumSongs(album: album)),
          )
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: new BorderRadius.circular(4.0),
            child: Image.asset(
              album.imagePath,
              width: 52.0,
              height: 52.0,
            ),
          ),
          title: Text(album.title),
        ),
      ),
    );
  }
}
