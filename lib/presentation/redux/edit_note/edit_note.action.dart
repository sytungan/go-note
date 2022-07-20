import 'package:flutter/material.dart';
import 'package:gonote/data/entitiers/task_entity.dart';

class EditNoteAction {
  @override
  String toString() {
    return 'EditNoteAction { }';
  }
}

class TitleChangeAction {
  const TitleChangeAction(this.title);
  final String title;
}

class ContentChangeAction {
  const ContentChangeAction(this.content);
  final String content;
}

class AddTaskAction {
  final TaskEntity task;
  const AddTaskAction(this.task);
}

class RemoveTaskAction {
  final int index;
  const RemoveTaskAction(this.index);
}

class ModifyTaskAction {
  final TaskEntity task;
  final int index;
  const ModifyTaskAction(this.index, this.task);
}

class EditNoteSuccessAction {
  final int isSuccess;

  EditNoteSuccessAction({required this.isSuccess});
  @override
  String toString() {
    return 'EditNoteSuccessAction { isSuccess: $isSuccess }';
  }
}

class EditNoteFailedAction {
  final String error;

  EditNoteFailedAction({required this.error});

  @override
  String toString() {
    return 'EditNoteFailedAction { error: $error }';
  }
}
