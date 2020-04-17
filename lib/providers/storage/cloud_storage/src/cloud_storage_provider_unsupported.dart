import 'package:comvalglo/providers/storage/storage_provider.dart';

class CloudStorageProvider extends StorageProvider {
  Future<dynamic> loadImage(String imageName) {
    throw ("Platform not found");
  }
}
