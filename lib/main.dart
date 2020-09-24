import 'package:comvalglo/core/home/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/data/persons_repository.dart';
import 'package:comvalglo/data/photos_reposirory.dart';

import 'package:comvalglo/providers/storage/storage_provider.dart';
import 'package:comvalglo/providers/storage/cloud_storage/cloud_storage.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/screens.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final StorageProvider _cloudStorageProvider = CloudStorageProvider();
  @override
  Widget build(BuildContext context) {
    final PhotosRepository photosRepository = PhotosRepository(
      storageProvider: _cloudStorageProvider,
    );
    photosRepository.loadAllPhotosUri();

    return FutureBuilder(
      future: photosRepository.loadAllPhotosUri(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              Provider<PhotosRepository>(create: (_) => photosRepository),
              Provider<PersonsRepository>(create: (_) => PersonsRepository())
            ],
            child: BlocProvider(
              create: (_) => HomeBloc(),
              child: MaterialApp(
                  title: 'ComValGlo',
                  theme: ThemeData(
                    primarySwatch: Colors.red,
                    primaryColor: Colors.redAccent[400],
                    accentColor: Colors.purple[800],
                  ),
                  initialRoute: Routes.home,
                  onGenerateRoute: (settings) {
                    switch (settings.name) {
                      case Routes.home:
                        return MaterialPageRoute(
                          builder: (_) => PageScreen(
                            key: Key('home-screen'),
                            route: settings.name,
                            body: HomeScreen(),
                          ),
                        );
                        break;
                      case Routes.gallery:
                        return MaterialPageRoute(
                          builder: (_) => PageScreen(
                            key: Key('gallery-screen'),
                            route: settings.name,
                            body: GalleryScreen(),
                          ),
                        );
                        break;
                      default:
                        return MaterialPageRoute(
                          builder: (_) => PageScreen(
                            key: Key('not-found-screen'),
                            route: settings.name,
                            body: NotFoundScreen(),
                          ),
                        );
                        break;
                    }
                  }),
            ),
          );
        } else {
          return Center(
            child: Container(
                height: 300.0,
                width: 300.0,
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.redAccent[400]),
                  ),
                )),
          );
        }
      },
    );
  }
}
