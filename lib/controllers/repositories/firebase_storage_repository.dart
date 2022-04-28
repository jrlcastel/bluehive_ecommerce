import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // fetch download url of firebase storage image
  Future<String> getDownloadUrl({required String imgUrl}) async 
    => await firebaseStorage.ref(imgUrl).getDownloadURL();


}