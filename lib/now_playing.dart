import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:mp3_player/models/song_model.dart';
import 'package:mp3_player/provider/state_provider.dart';
import 'package:provider/provider.dart';

class NowPLaying extends StatefulWidget {
  const NowPLaying({super.key});

  @override
  State<NowPLaying> createState() => _NowPLayingState();
}

class _NowPLayingState extends State<NowPLaying> {
  var _playerProgress = 0.2;
  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, value, child) {
        final Song cur_song = value.songs[value.now_playing_id];
        return Scaffold(
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Now Playing"),
                    Text(
                      cur_song.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //Cover Art
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400,
                  width: 400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                cur_song.artists[0],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(),
              //Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProgressBar(
                  progress: Duration(milliseconds: 1000),
                  buffered: Duration(milliseconds: 2000),
                  total: Duration(milliseconds: 5000),
                  timeLabelLocation: TimeLabelLocation.sides,
                  onSeek: (duration) {
                    print("User selected a new time : $duration");
                  },
                ),
              ),
              Divider(),
              //Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.shuffle),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {
                      value.prevSong();
                    },
                    iconSize: 75,
                  ),
                  IconButton(
                    icon: value.isPlaying
                        ? Icon(Icons.pause)
                        : Icon(Icons.play_arrow),
                    onPressed: () {
                      value.setIsPlaying();
                    },
                    iconSize: 75,
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    onPressed: () {
                      value.nextSong();
                    },
                    iconSize: 75,
                  ),
                  IconButton(
                    icon: cur_song.favorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
