import 'package:flutter/material.dart';
import 'package:gonote/utils/device_camera.dart';
import 'injection.dart';
import 'app.dart';

void main() async {
  setupInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await DeviceCamera.initialize();
  runApp(const App());
}
