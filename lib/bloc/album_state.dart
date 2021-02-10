part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  final idcount;
  const AlbumState({this.idcount});

  @override
  List<Object> get props => [];
}

class AlbumInitState extends AlbumState {
  AlbumInitState() : super(idcount: 0);
}

class AlbumLoadingState extends AlbumState {
  AlbumLoadingState();

  @override
  List<Object> get props => [idcount];
}

class AlbumLoadedState extends AlbumState {
  final List<AlbumModel> albums;
  const AlbumLoadedState({this.albums}) : super(idcount: albums.length);
  @override
  List<Object> get props => [albums, idcount];
}

class AlbumErrorState extends AlbumState {
  final String message;
  const AlbumErrorState({this.message}) : super(idcount: 0);

  @override
  List<Object> get props => [message];
}
