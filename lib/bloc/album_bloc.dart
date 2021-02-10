import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/model/album_model.dart';
import 'package:upstreet_flutter_code_challenge/services/api.dart';

part 'album_event.dart';
part 'album_state.dart';

/// Bloc defined for events:
/// 1. AlbumAPIFetch
/// 2. AlbumPhotoAdded
/// 3. AlbumPhotoEdited
/// ---
/// Possible Response states:
/// 1. AlbumInitState
/// 2. AlbumLoadingState
/// 3. AlbumLoadedState
/// 4. AlbumErrorState
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitState());
  List<AlbumModel> albums;
  final albumApi = AlbumAPI();
  @override
  Stream<AlbumState> mapEventToState(
    AlbumEvent event,
  ) async* {
    if (event is AlbumAPIFetch) {
      yield AlbumLoadingState();
      try {
        albums = await albumApi.getAlbums();
        yield AlbumLoadedState(albums: albums);
      } catch (error) {
        yield AlbumErrorState(message: error.toString());
      }
    } else if (event is AlbumPhotoAdded) {
      yield AlbumLoadingState();
      try {
        albums.insert(
          0,
          AlbumModel(
            albumId: 1,
            id: albums.length + 1,
            title: event.title,
            url: event.url,
            thumbnailUrl: event.url,
          ),
        );

        yield AlbumLoadedState(albums: albums);
      } catch (error) {
        yield AlbumErrorState(message: error.toString());
      }
    } else if (event is AlbumPhotoEdited) {
      yield AlbumLoadingState();
      try {
        int index = albums.indexOf(AlbumModel(id: event.id));
        albums[index] = AlbumModel(
          id: event.id,
          url: event.url,
          thumbnailUrl: event.url,
          title: event.title,
        );
        yield AlbumLoadedState(albums: albums);
      } catch (error) {
        yield AlbumErrorState(message: error.toString());
      }
    }
  }
}
