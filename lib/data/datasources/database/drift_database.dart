import 'package:drift/drift.dart';
import 'package:gonote/config/database/app_database.dart';

part 'drift_database.g.dart';

@DataClassName(AppDatabaseConfig.tableNote)
class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get date => dateTime()();
}

@DataClassName(AppDatabaseConfig.tableTask)
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  BoolColumn get done => boolean()();
  IntColumn get noteId => integer().references(Notes, #id)();
}

abstract class NoteItemCount extends View {
  Notes get notes;

  Expression<int> get itemCount => notes.id.count();

  @override
  Query as() => select([
        notes.title,
        itemCount,
      ]).from(notes);
}

@DriftDatabase(tables: [
  Notes,
  Tasks,
], views: [
  NoteItemCount
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
    );
  }

  Future<List<Note>> get allNotes => select(notes).get();

  Future<List<Task>> getTaskInNote(Note note) =>
      (select(tasks)..where((t) => t.noteId.equals(note.id))).get();

  Future<int> addNote(NotesCompanion note) => into(notes).insert(note);

  Future<int> addTask(TasksCompanion task) => into(tasks).insert(task);
}
