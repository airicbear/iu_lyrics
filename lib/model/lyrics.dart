class Lyrics {
  final Map<String, List<String>> allLyrics;

  Lyrics({required this.allLyrics});

  int get length {
    return allLyrics.length;
  }

  Iterable<MapEntry<String, List<String>>> get entries {
    return allLyrics.entries;
  }

  Iterable<String> get keys {
    return allLyrics.keys;
  }

  Iterable<List<String>> get values {
    return allLyrics.values;
  }

  factory Lyrics.fromJson(Map<String, dynamic> lyrics) {
    final lyricsMap = {
      for (var key in lyrics.keys)
        '$key': List<String>.from(lyrics[key]),
    };

    return Lyrics(
      allLyrics: lyricsMap,
    );
  }
}
