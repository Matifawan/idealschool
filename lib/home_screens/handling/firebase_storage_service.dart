import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

Future<String?> getDownloadUrl(String storagePath) async {
  try {
    // Create a reference to the image in Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child(storagePath);

    // Get the download URL for the image
    String downloadUrl = await ref.getDownloadURL();

    return downloadUrl;
  } catch (e) {
    if (kDebugMode) {
      print('Error getting download URL: $e');
    }
    return null;
  }
}
