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
        Song song = album.songs.elementAt(index);

        return _AlbumSongItem(
          albumCoverArt: album.imagePath,
          song: song,
        );
      },
    );
  }
}

class _AlbumSongItem extends StatelessWidget {
  final String albumCoverArt;
  final Song song;

  const _AlbumSongItem({
    Key? key,
    required this.albumCoverArt,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!song.hasLyrics()) {
      return Card(
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: ClipRRect(
              borderRadius: new BorderRadius.circular(4.0),
              child: Container(
                width: 52.0,
                height: 52.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: ExactAssetImage(albumCoverArt),
                  ),
                ),
              ),
            ),
            title: Text(
              song.title,
              style: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
      );
    }

    return Card(
      child: InkWell(
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
      ),
    );
  }
}
