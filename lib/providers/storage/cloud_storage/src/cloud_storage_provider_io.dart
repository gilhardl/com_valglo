import 'package:firebase_storage/firebase_storage.dart';

import 'package:comvalglo/providers/storage/storage_provider.dart';

class CloudStorageProvider extends StorageProvider {
  CloudStorageProvider({FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseStorage _firebaseStorage;

  Future<dynamic> loadImage(
    String imageName,
  ) async {
    return await _firebaseStorage.ref().child(imageName).getDownloadURL();
  }
}
