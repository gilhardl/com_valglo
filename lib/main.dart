import 'package:comvalglo/data/persons_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/data/photos_reposirory.dart';

import 'package:comvalglo/providers/storage/storage_provider.dart';
import 'package:comvalglo/providers/storage/cloud_storage/cloud_storage.dart';

import 'package:comvalglo/ui/app_bar/app_bar_menu_button.dart';
import 'package:comvalglo/ui/app_bar/app_bar_title.dart';
import 'package:comvalglo/ui/home/home_screen.dart';
import 'package:comvalglo/ui/gallery/gallery_screen.dart';

void main() => runApp(App());

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
            child: MaterialApp(
              title: 'ComValGlo',
              theme: ThemeData(
                primarySwatch: Colors.red,
                primaryColor: Colors.redAccent[400],
                accentColor: Colors.purple[800],
              ),
              initialRoute: Routes.home,
              routes: {
                Routes.home: (_) => HomeScreen(
                      appBar: _buildAppBar(Routes.home),
                    ),
                Routes.gallery: (_) =>
                    GalleryScreen(appBar: _buildAppBar(Routes.gallery)),
              },
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

  AppBar _buildAppBar(String currentRoute) => AppBar(
        title: AppBarTitle(),
        actions: <Widget>[
          AppBarMenuButton(
            text: 'Accueil',
            route: Routes.home,
            currentRoute: currentRoute,
          ),
          AppBarMenuButton(
            text: 'Notre histoire',
            route: Routes.home,
            currentRoute: currentRoute,
          ),
          AppBarMenuButton(
            text: 'Qui sommes nous ?',
            route: Routes.home,
            currentRoute: currentRoute,
          ),
          AppBarMenuButton(
            text: 'Galerie',
            route: Routes.gallery,
            currentRoute: currentRoute,
          ),
          AppBarMenuButton(
            text: 'Nous contacter',
            route: Routes.home,
            currentRoute: currentRoute,
          )
        ],
      );
}
