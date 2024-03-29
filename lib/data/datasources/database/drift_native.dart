import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'drift_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

AppDatabase constructDb() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
  return AppDatabase(db);
}
