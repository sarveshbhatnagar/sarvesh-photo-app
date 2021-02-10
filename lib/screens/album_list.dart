import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstreet_flutter_code_challenge/bloc/album_bloc.dart';
import 'package:upstreet_flutter_code_challenge/screens/router/app_router.dart';

class AlbumList extends StatefulWidget {
  const AlbumList();

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    BlocProvider.of<AlbumBloc>(context).add(AlbumAPIFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album List'),
      ),
      floatingActionButton: IconButton(
          highlightColor: Colors.grey,
          hoverColor: Colors.grey[200],
          icon: Icon(Icons.add),
          onPressed: () {
            print("Add Pressed");
            Navigator.of(context).pushNamed(
              '/add',
            );
          }),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: state.idcount,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    state.albums[index].thumbnailUrl,
                    height: 60.0,
                    width: 60.0,
                  ),
                  title: Text(state.albums[index].title),
                  onTap: () {
                    print("tapped ${state.albums[index].id}");
                    Navigator.of(context).pushNamed('/photo',
                        arguments: AppRouterArguments(state.albums[index]));
                  },
                );
              },
            );
          } else if (state is AlbumInitState) {
            return Center(
              child: Text(
                "Please wait while your application initializes.",
              ),
            );
          } else if (state is AlbumErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text(
                "Something unexpected occured, Please Reload the application or contact if error persists.",
              ),
            );
          }
        },
      ),
    );
  }
}
