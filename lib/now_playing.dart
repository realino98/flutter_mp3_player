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
              Card(
                // borderRadius: BorderRadius.circular(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  //set border radius more than 50% of height and width to make circle
                ),
                elevation: 50,
                child: cur_song.album_cover != ""
                    ? Image.network(
                        cur_song.album_cover,
                        width: 400,
                        height: 400,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.album,
                        size: 400,
                      ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                cur_song.artists[0],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Divider(),
              //Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProgressBar(
                  progress: Duration(seconds: value.cur_time),
                  // buffered: Duration(milliseconds: 2000),
                  total: Duration(seconds: cur_song.duration),
                  timeLabelLocation: TimeLabelLocation.sides,
                  onSeek: (duration) {
                    value.setCurTime(duration.inSeconds);
                  },
                ),
              ),
              Divider(),
              //Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.shuffle_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_previous_rounded),
                    onPressed: () {
                      value.prevSong();
                    },
                    iconSize: 75,
                  ),
                  IconButton(
                    icon: Icon(value.isPlaying
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded),
                    onPressed: () {
                      value.setIsPlaying();
                      if (value.isPlaying) {
                        setState(() {
                          value.startTime(cur_song.song_id);
                          print(value.cur_time);
                        });
                      }
                    },
                    iconSize: 75,
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next_rounded),
                    onPressed: () {
                      value.nextSong();
                    },
                    iconSize: 75,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: cur_song.favorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      value.toggleFavorite(cur_song.song_id);
                    },
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
