import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:gonote/data/datasources/database/drift_database.dart';
import 'package:gonote/injection.dart';
import 'app.dart';

void main() async {
  setup();
  final a = getIt.get<AppDatabase>();
  a.addNote(NotesCompanion(title: Value(""), date: Value(DateTime.now())));
  final b = await a.allNotes;
  print(b);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
