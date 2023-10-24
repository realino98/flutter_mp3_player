import 'package:flutter/material.dart';
import 'package:mp3_player/now_playing.dart';
import 'package:mp3_player/playlist.dart';
import 'package:mp3_player/provider/state_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _element = [
    Playlist(),
    NowPLaying(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, value, child) => Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[200],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play),
              label: "Playlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: "Now Playing",
            ),
          ],
          onTap: (val) {
            setState(() {
              value.setPageState(val);
            });
          },
          currentIndex: value.page_state,
        ),
        body: _element.elementAt(value.page_state),
      ),
    );
  }
}
