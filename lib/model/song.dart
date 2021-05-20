import 'package:iu_lyrics/model/lyrics.dart';

class Song {
  final String title;
  final Lyrics lyrics;

  Song({required this.title, required this.lyrics});

  bool hasLyrics() {
    return lyrics.allLyrics.isNotEmpty &&
        lyrics.allLyrics.values.any((element) => element.isNotEmpty);
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'] as String,
      lyrics: Lyrics.fromJson(json['lyrics']),
    );
  }
}
