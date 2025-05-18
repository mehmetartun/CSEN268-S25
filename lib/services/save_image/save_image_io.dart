import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class SaveImage {
  static Future<String> saveImageToGallery(XFile file) async {
    await FileSaver.instance.saveFile(
      name: "Hello",
      filePath: file.path,
      ext: "jpg",
      mimeType: MimeType.jpeg,
    );

    return "OK";
  }

  static Future<String?> uploadImageToStorage({
    required XFile file,
    required Reference storageReference,
    void Function(double)? progressCallback,
  }) async {
    await storageReference.putFile(File(file.path));
    UploadTask task = storageReference.putFile(File(file.path));
    if (progressCallback != null) {
      task.snapshotEvents.listen((event) {
        double progress = event.bytesTransferred / event.totalBytes;
        progressCallback(progress);
      });
    }

    TaskSnapshot snapshot = await task;
    if (snapshot.state == TaskState.success) {
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } else {
      return null;
    }
  }
}
