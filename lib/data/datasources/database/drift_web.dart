import 'package:drift/web.dart';
import 'drift_database.dart';

AppDatabase constructDb() => AppDatabase(WebDatabase('db'));
