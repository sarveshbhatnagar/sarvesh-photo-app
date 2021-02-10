import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstreet_flutter_code_challenge/bloc/album_bloc.dart';
import 'package:upstreet_flutter_code_challenge/screens/router/app_router.dart';

import './screens/album_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumBloc(),
      child: MaterialApp(
        title: 'Upstreet Flutter code challenge',
        theme: ThemeData(
          primaryColor: const Color(0xff01046d),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const AlbumList(),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
