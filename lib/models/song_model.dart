class Song {
  final int song_id;
  final String title;
  final List<String> artists;
  final int duration;
  bool favorite;
  final String album_cover;
  final int times_listened;

  Song({
    required this.song_id,
    required this.title,
    required this.artists,
    required this.duration,
    required this.favorite,
    required this.album_cover,
    required this.times_listened,
  });
  factory Song.fromMap(Map<String, dynamic> song) {
    return Song(
      song_id: song["song_id"],
      album_cover: song["album_cover"] ?? "",
      title: song["title"],
      artists: song["artists"],
      duration: song["duration"],
      favorite: song["favorite"],
      times_listened: song["times_listened"],
    );
  }
}
