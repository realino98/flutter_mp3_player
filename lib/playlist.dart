import 'package:flutter/material.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          leading: Icon(Icons.album),
          title: Text("Test"),
        );
      },
    );
  }
}
