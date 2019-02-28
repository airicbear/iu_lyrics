import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/album/list.dart';

class Album extends StatelessWidget {

  final String albumTitle;
  final int albumIndex;

  Album({Key key, this.albumTitle, this.albumIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(albumTitle),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle
            .of(context)
            .loadString('assets/iu.json'),
          builder: (context, snapshot) {
            var lyrics = json.decode(snapshot.data.toString());
            return LyricsList(lyrics: lyrics, albumTitle: albumTitle, albumIndex: albumIndex,);
          }
        ),
      ),
    );
  }
}
