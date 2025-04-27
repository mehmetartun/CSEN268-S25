import 'package:file_saver/file_saver.dart';
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
}
