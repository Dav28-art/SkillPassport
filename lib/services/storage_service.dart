import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfilePhoto({
    required String userId,
    required Uint8List fileBytes,
  }) async {
    final reference = _storage.ref().child(
          'profile_photos/$userId.jpg',
        );

    await reference.putData(
      fileBytes,
      SettableMetadata(contentType: 'image/jpeg'),
    );

    return reference.getDownloadURL();
  }

  Future<String> uploadCv({
    required String userId,
    required Uint8List fileBytes,
    String fileName = 'cv.pdf',
  }) async {
    final reference = _storage.ref().child(
          'cvs/$userId/$fileName',
        );

    await reference.putData(
      fileBytes,
      SettableMetadata(contentType: 'application/pdf'),
    );

    return reference.getDownloadURL();
  }
}