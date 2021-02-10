import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/model/album_model.dart';
import 'package:upstreet_flutter_code_challenge/screens/router/app_router.dart';

class PhotoScreen extends StatelessWidget {
  final AlbumModel photo;
  const PhotoScreen({this.photo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("id: ${photo.id}"),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/edit',
            arguments: AppRouterArguments(photo),
          );
        },
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Image.network(
              photo.url,
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            photo.title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
