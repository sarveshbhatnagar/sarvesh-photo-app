import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/model/album_model.dart';
import 'package:upstreet_flutter_code_challenge/screens/album_list.dart';
import 'package:upstreet_flutter_code_challenge/screens/photo_add_screen.dart';
import 'package:upstreet_flutter_code_challenge/screens/photo_edit_screen.dart';
import 'package:upstreet_flutter_code_challenge/screens/photo_screen.dart';

class AppRouterArguments {
  final AlbumModel photo;

  AppRouterArguments(
    this.photo,
  );
}

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => AlbumList(),
        );
      case '/photo':
        final AppRouterArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => PhotoScreen(
            photo: args.photo,
          ),
        );
      case '/edit':
        final AppRouterArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => PhotoEdit(
            photo: args.photo,
          ),
        );
      case '/add':
        return MaterialPageRoute(
          builder: (_) => PhotoAdd(),
        );

      default:
        return null;
    }
  }
}
