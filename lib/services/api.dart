import 'package:http/http.dart' as http;
import 'package:upstreet_flutter_code_challenge/model/album_model.dart';

const API_ALBUMS_PHOTOS =
    'https://jsonplaceholder.typicode.com/albums/1/photos';

abstract class AlbumRepository {
  Future<List<AlbumModel>> getAlbums();
}

/// returns albums if it gets response
/// otherwise returns response for further handling.
class AlbumAPI implements AlbumRepository {
  @override
  Future<List<AlbumModel>> getAlbums() async {
    var client = http.Client();

    final response = await client.get(API_ALBUMS_PHOTOS);
    if (response.statusCode == 200) {
      List<AlbumModel> albums = albumModelFromJson(response.body);
      return albums;
    }
    throw response;
  }
}
