import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isDenied) {
      throw Exception('Camera permission denied.');
    } else if (status.isPermanentlyDenied) {
      throw Exception('Camera permission permanently denied. Please enable it from settings.');
    }
  }
}
