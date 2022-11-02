import 'package:camera/camera.dart';

class DeviceCamera {
  DeviceCamera._();
  static List<CameraDescription> cameras = const [];

  static Future<void> initialize() async {
    cameras = await availableCameras();
  }
}
