import 'package:get_it/get_it.dart';
import 'package:gonote/data/datasources/local_database.dart';

import 'data/datasources/database/drift_database.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppDatabase>(constructDb());
}
