import 'package:image_picker/image_picker.dart';
import 'storage_helper.dart';

class PhotoHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<String?> capturePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      await StorageHelper.savePhotoPath(photo.path);
      return photo.path;
    }
    return null;
  }

  static Future<String?> selectPhotoFromGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      await StorageHelper.savePhotoPath(photo.path);
      return photo.path;
    }
    return null;
  }
}
