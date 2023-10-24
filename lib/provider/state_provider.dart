import 'package:flutter/material.dart';
import 'package:mp3_player/models/song_model.dart';
import 'package:mp3_player/now_playing.dart';

class MusicPlayerProvider extends ChangeNotifier {
  List<Song> _songs = [
    Song(
      song_id: 0,
      title: "Listen",
      artists: ["Beyonce"],
      duration: 230,
      favorite: false,
      album_cover: "",
      times_listened: 0,
    ),
    Song(
      song_id: 1,
      title: "Halo",
      artists: ["Beyonce"],
      duration: 230,
      favorite: false,
      album_cover: "",
      times_listened: 0,
    ),
    Song(
      song_id: 2,
      title: "Love Story",
      artists: ["Taylor Swift"],
      duration: 230,
      favorite: true,
      album_cover: "",
      times_listened: 0,
    ),
  ];
  int _page_state = 1;
  int _now_playing_id = 0;
  bool _isPlaying = false;

  get page_state => _page_state;
  get now_playing_id => _now_playing_id;
  get isPlaying => _isPlaying;
  get songs => _songs;

  setPageState(int number) {
    _page_state = number;
    notifyListeners();
  }

  setNowPlaying(int id) {
    _now_playing_id = id;
    notifyListeners();
  }

  setIsPlaying() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  nextSong() {
    if (_now_playing_id == _songs.length - 1) {
      _now_playing_id = 0;
    } else {
      _now_playing_id += 1;
    }
    notifyListeners();
  }

  toggleFavorite() {
    notifyListeners();
  }

  prevSong() {
    if (_now_playing_id == 0) {
      _now_playing_id = _songs.length - 1;
    } else {
      _now_playing_id -= 1;
    }
    notifyListeners();
  }
}
