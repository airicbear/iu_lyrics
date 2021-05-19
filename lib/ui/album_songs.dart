import 'package:flutter/material.dart';
import 'package:iu_lyrics/model/album.dart';
import 'package:iu_lyrics/model/song.dart';
import 'package:iu_lyrics/ui/song_lyrics.dart';

class AlbumSongs extends StatelessWidget {
  final Album album;

  AlbumSongs({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Container(
        child: _AlbumSongsList(album: album),
      ),
    );
  }
}

class _AlbumSongsList extends StatelessWidget {
  final Album album;

  _AlbumSongsList({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: album.songs.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: _AlbumSongItem(
            albumCoverArt: album.imagePath,
            song: album.songs.elementAt(index),
          ),
        );
      },
    );
  }
}

class _AlbumSongItem extends StatelessWidget {
  final String albumCoverArt;
  final Song song;

  const _AlbumSongItem(
      {Key? key, required this.albumCoverArt, required this.song})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SongLyrics(song: song)),
        );
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: new BorderRadius.circular(4.0),
          child: Image.asset(albumCoverArt, width: 52.0, height: 52.0),
        ),
        title: Text(song.title),
      ),
    );
  }
}
