import 'package:gonote/data/entitiers/task_entity.dart';

class NoteEntity {
  final String title;
  final String? content;
  final DateTime? date;
  final List<TaskEntity> tasks;
  const NoteEntity({
    this.title = "",
    this.content = "",
    this.date,
    this.tasks = const <TaskEntity>[],
  });

  NoteEntity copyWith({
    String? newTitle,
    String? newContent,
    DateTime? newDate,
    List<TaskEntity>? newTasks,
  }) =>
      NoteEntity(
        title: newTitle ?? title,
        content: newContent ?? content,
        date: newDate ?? date,
        tasks: newTasks ?? tasks,
      );
}
