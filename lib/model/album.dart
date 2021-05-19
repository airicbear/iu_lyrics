import 'package:iu_lyrics/model/song.dart';

class Album {
  final String title;
  final DateTime releaseDate;
  final String imagePath;
  final Iterable<dynamic> songs;

  Album({
    required this.title,
    required this.releaseDate,
    required this.imagePath,
    required this.songs,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['album'] as String,
      releaseDate: DateTime.parse(json['date'] as String),
      imagePath: json['coverArt'] as String,
      songs: List<Song>.from(
        (json['songs'] as Iterable).map(
          (song) => Song.fromJson(song),
        ),
      ),
    );
  }
}
