import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const String _photoPathKey = 'photo_path';

  static Future<void> savePhotoPath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_photoPathKey, path);
  }

  static Future<String?> getPhotoPath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_photoPathKey);
  }
}
