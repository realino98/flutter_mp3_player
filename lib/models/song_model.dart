class Song {
  final String title;
  final List<String> artists;
  final int duration;
  final bool favorite;
  final String album_cover;
  final int times_listened;

  Song({
    required this.title,
    required this.artists,
    required this.duration,
    required this.favorite,
    required this.album_cover,
    required this.times_listened,
  });
  factory Song.fromMap(Map<String, dynamic> song) {
    return Song(
      album_cover: song["album_cover"],
      title: song["title"],
      artists: song["artists"],
      duration: song["duration"],
      favorite: song["favorite"],
      times_listened: song["times_listened"],
    );
  }
}
