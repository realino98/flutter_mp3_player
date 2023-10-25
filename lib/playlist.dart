import 'package:flutter/material.dart';
import 'package:mp3_player/provider/state_provider.dart';
import 'package:provider/provider.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.songs.length,
          itemBuilder: (context, index) {
            final song = value.songs[index];
            final song_duration = (song.duration ~/ 60).toString() +
                ":" +
                (song.duration % 60).toString();
            return ListTile(
              onTap: () {
                value.setPageState(1);
                value.setNowPlaying(song.song_id);
              },
              leading: song.album_cover != ""
                  ? Image.network(
                      song.album_cover,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.album,
                    ),
              title: Text(song.title),
              subtitle: Row(
                children: [
                  Text(song.artists[0]),
                  Text(" - "),
                  Text(song_duration),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  value.toggleFavorite(song.song_id);
                },
                icon: Icon(
                  Icons.favorite,
                  color: song.favorite ? Colors.red : Colors.grey,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
