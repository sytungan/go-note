class TaskEntity {
  final String content;
  final bool done;
  final int noteId;
  const TaskEntity({this.content = "", this.done = false, this.noteId = -1});
  TaskEntity copyWith({
    String? newContent,
    bool? newDone,
  }) =>
      TaskEntity(
        content: newContent ?? content,
        done: newDone ?? done,
      );
}
