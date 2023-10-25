import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mp3_player/models/song_model.dart';

class MusicPlayerProvider extends ChangeNotifier {
  List<Song> _songs = [
    Song(
      song_id: 0,
      title: "Ghost",
      artists: ["Justin Bieber"],
      duration: 230,
      favorite: false,
      album_cover:
          "https://www.indystar.com/gcdn/presto/2021/03/18/PIND/81c53026-e263-45dd-9c7a-1541d67c398d-bieber_album_cover.jpg",
      times_listened: 0,
    ),
    Song(
      song_id: 1,
      title: "Faded",
      artists: ["Alan Walker"],
      duration: 230,
      favorite: false,
      album_cover:
          "https://i1.sndcdn.com/artworks-000169731686-zgvff2-t500x500.jpg",
      times_listened: 0,
    ),
    Song(
      song_id: 2,
      title: "Love Story",
      artists: ["Taylor Swift"],
      duration: 330,
      favorite: true,
      album_cover:
          "https://i.scdn.co/image/ab67616d0000b2737b25c072237f29ee50025fdc",
      times_listened: 0,
    ),
    Song(
      song_id: 3,
      title: "All of Me",
      artists: ["John Legend"],
      duration: 320,
      favorite: true,
      album_cover:
          "https://upload.wikimedia.org/wikipedia/en/6/64/John_Legend_Love_in_the_Future.jpg",
      times_listened: 0,
    ),
  ];
  int _page_state = 1;
  int _now_playing_id = 0;
  Timer? timer;
  bool _isPlaying = false;
  // bool _isPlaying = timer == null ? false : timer!.isActive;
  int _cur_time = 0;

  get page_state => _page_state;
  get now_playing_id => _now_playing_id;
  get isPlaying => _isPlaying;
  get songs => _songs;
  get cur_time => _cur_time;

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
    _isPlaying = true;
    _cur_time = 0;
    notifyListeners();
  }

  prevSong() {
    if (_now_playing_id == 0) {
      _now_playing_id = _songs.length - 1;
    } else {
      _now_playing_id -= 1;
    }
    _isPlaying = true;
    _cur_time = 0;

    notifyListeners();
  }

  toggleFavorite(int song_id) {
    _songs[song_id].favorite = !_songs[song_id].favorite;
    notifyListeners();
  }

  startTime(int song_id) {
    Timer.periodic(Duration(seconds: 1), (_) {
      if (isPlaying) {
        _cur_time++;
        if (_cur_time == _songs[song_id].duration) {
          nextSong();
        }
      }
      print(_cur_time);
      notifyListeners();
    });
  }

  setCurTime(int time) {
    _cur_time = time;
    notifyListeners();
  }

  resetTime() {
    _cur_time = 0;
    notifyListeners();
  }
}
