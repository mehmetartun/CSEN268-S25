import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class SaveImage {
  static Future<String> saveImageToGallery(XFile file) async {
    Directory? application_dir = await getDownloadsDirectory();

    if (application_dir != null) {
      await FileSaver.instance.saveFile(
        file: File(file.path),
        name: "Hello",
        filePath: p.join(application_dir.path, "Hello.jpg"),

        ext: "jpg",
        mimeType: MimeType.jpeg,
      );

      return "Saved to ${application_dir.path}";
    } else {
      return "Download Directory Not Found";
    }
  }
}
