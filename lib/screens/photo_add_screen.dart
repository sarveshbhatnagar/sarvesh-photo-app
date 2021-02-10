import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstreet_flutter_code_challenge/bloc/album_bloc.dart';

class PhotoAdd extends StatefulWidget {
  @override
  _PhotoAddState createState() => _PhotoAddState();
}

class _PhotoAddState extends State<PhotoAdd> {
  String url;

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Album"),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          BlocProvider.of<AlbumBloc>(context)
              .add(AlbumPhotoAdded(url: url, title: title));
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          TextField(
            onChanged: (value) {
              url = value;
            },
            decoration: InputDecoration(
              hintText: "Album Cover Url",
            ),
          ),
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(
              hintText: "Album Title",
            ),
          ),
        ],
      ),
    );
  }
}
