import 'package:firebase/firebase.dart' as firebase;

import 'package:comvalglo/constants.dart';
import 'package:comvalglo/providers/storage/storage_provider.dart';

class CloudStorageProvider extends StorageProvider {
  CloudStorageProvider() {
    firebase.initializeApp(
      apiKey: kFirebaseWebApiKey,
      authDomain: "$kFirebaseWebProjectId.firebaseapp.com",
      databaseURL: "https://$kFirebaseWebProjectId.firebaseio.com",
      projectId: kFirebaseWebProjectId,
      storageBucket: "$kFirebaseWebProjectId.appspot.com",
      messagingSenderId: kFirebaseMessagingSenderId,
      appId: kFirebaseAppId,
      measurementId: kFirebaseMeasurementId,
    );
  }

  Future<dynamic> loadImage(String imageName) async {
    return firebase.storage().ref(imageName).getDownloadURL();
  }
}
