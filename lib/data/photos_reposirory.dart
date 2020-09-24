import 'package:comvalglo/data/photo.dart';
import 'package:comvalglo/providers/storage/cloud_storage/cloud_storage.dart';
import 'package:comvalglo/providers/storage/storage_provider.dart';

class PhotosRepository {
  PhotosRepository({StorageProvider storageProvider})
      : _storageProvider = storageProvider ?? CloudStorageProvider();

  final StorageProvider _storageProvider;

  List<Photo> photos = [
    Photo(
      title: 'Restaurant PIC',
      description: '',
      name: '1.png',
    ),
    Photo(
      title: 'Parc Jouvet',
      description: '',
      name: '2.png',
    ),
    Photo(
      title: '',
      description: '',
      name: '3.png',
    ),
    Photo(
      title: 'Kiosque de Valence',
      description: '',
      name: '4.png',
    ),
    Photo(
      title: '',
      description: '',
      name: '5.jpg',
    ),
    Photo(
      title: "Valrhona - Cité du chocolat a Tain l'Hermitage",
      description: '',
      name: '6.png',
    ),
    Photo(
      title: "Gorges de l'Ardèche",
      description: '',
      name: '7.jpg',
    ),
    Photo(
      title: '',
      description: '',
      name: '8.jpg',
    ),
    Photo(
      title: 'Gare de Valence TGV',
      description: '',
      name: '9.png',
    ),
    Photo(
      title: '',
      description: '',
      name: '10.png',
    ),
    Photo(
      title: "Tain l'Hermitage / Tournon - Le Rhône",
      description: '',
      name: '11.png',
    ),
    Photo(
      title: 'Cinéma de Valence',
      description: '',
      name: '12.png',
    ),
  ];

  bool get allPhotosUriLoaded =>
      photos.every((Photo photo) => photo.uri != null);

  Future<void> loadAllPhotosUri() async {
    await Future.wait(photos.map((Photo photo) async {
      photo.uri = (await _storageProvider.loadImage(photo.name)).toString();
      return photo;
    }));
  }

  Future<dynamic> loadPhotoUri(String name) {
    return _storageProvider.loadImage(name);
  }
}
