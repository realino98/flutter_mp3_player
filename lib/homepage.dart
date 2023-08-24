import 'package:flutter/material.dart';
import 'package:mp3_player/now_playing.dart';
import 'package:mp3_player/playlist.dart';

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

  int _pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
      ),
      body: _element.elementAt(_pageIndex),
    );
  }
}
