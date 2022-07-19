import 'package:flutter/material.dart';
import 'injection.dart';
import 'app.dart';

void main() async {
  setupInjection();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
