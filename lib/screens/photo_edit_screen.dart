import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstreet_flutter_code_challenge/bloc/album_bloc.dart';
import 'package:upstreet_flutter_code_challenge/model/album_model.dart';

class PhotoEdit extends StatefulWidget {
  final AlbumModel photo;
  PhotoEdit({this.photo});

  @override
  _PhotoEditState createState() => _PhotoEditState();
}

class _PhotoEditState extends State<PhotoEdit> {
  String url = "";
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("id: ${widget.photo.id}"),
      ),
      floatingActionButton: IconButton(
          icon: Icon(Icons.done),
          onPressed: () {
            if (url == "") {
              url = widget.photo.url;
            }
            if (title == "") {
              title = widget.photo.title;
            }
            BlocProvider.of<AlbumBloc>(context).add(
                AlbumPhotoEdited(url: url, title: title, id: widget.photo.id));
            Navigator.pop(context);
            Navigator.pop(context);
          }),
      body: ListView(
        children: [
          TextFormField(
            onChanged: (value) {
              url = value;
            },
            initialValue: "${widget.photo.url}",
          ),
          TextFormField(
            onChanged: (value) {
              title = value;
            },
            initialValue: "${widget.photo.title}",
          ),
        ],
      ),
    );
  }
}
