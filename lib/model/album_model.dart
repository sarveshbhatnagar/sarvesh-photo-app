/// To parse
/// 'https://jsonplaceholder.typicode.com/albums/1/photos'
/// JSON data do
///
/// final albumModel = albumModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<AlbumModel> albumModelFromJson(String str) =>
    List<AlbumModel>.from(json.decode(str).map((x) => AlbumModel.fromJson(x)));

String albumModelToJson(List<AlbumModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumModel extends Equatable {
  AlbumModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };

  @override
  List<Object> get props => [id];
}

// TODO Overview Assumption Model
// I assumed that we will be fetching data from this
// single api and wont be using multiple api's for the
// data. If there were multiple API, I would have opted
// for making a more general album_model ??? should I???
// Look at multiple apis.
