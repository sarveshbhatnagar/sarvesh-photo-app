part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class AlbumPhotoAdded extends AlbumEvent {
  final String url;
  final String title;

  const AlbumPhotoAdded({
    @required this.url,
    @required this.title,
  });

  @override
  List<Object> get props => [url, title];
}

class AlbumPhotoEdited extends AlbumEvent {
  final String url;
  final String title;
  final int id;
  const AlbumPhotoEdited({
    this.url,
    this.title,
    @required this.id,
  });

  @override
  List<Object> get props => [url, title];
}

class AlbumAPIFetch extends AlbumEvent {
  const AlbumAPIFetch();
  @override
  List<Object> get props => [];
}
