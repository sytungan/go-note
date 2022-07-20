import 'package:gonote/data/entitiers/note_entity.dart';
import 'package:gonote/presentation/redux/edit_note/edit_note.action.dart';
import 'package:redux/redux.dart';
import './edit_note.state.dart';

final editNoteReducer = combineReducers<EditNoteState>([
  TypedReducer(_titleChangeReducer),
  TypedReducer(_contentChangeReducer),
  TypedReducer(_addTaskReducer),
  TypedReducer(_removeTaskReducer),
  TypedReducer(_modifyTaskReducer),
]);

EditNoteState _titleChangeReducer(
  EditNoteState state,
  TitleChangeAction action,
) {
  return state.copyWith(newNote: state.note.copyWith(newTitle: action.title));
}

EditNoteState _contentChangeReducer(
  EditNoteState state,
  ContentChangeAction action,
) {
  return state.copyWith(
      newNote: state.note.copyWith(newContent: action.content));
}

EditNoteState _addTaskReducer(
  EditNoteState state,
  AddTaskAction action,
) {
  return state.copyWith(
      newNote:
          state.note.copyWith(newTasks: [...state.note.tasks, action.task]));
}

EditNoteState _removeTaskReducer(
  EditNoteState state,
  RemoveTaskAction action,
) {
  return state.copyWith(
      newNote: state.note
          .copyWith(newTasks: state.note.tasks..removeAt(action.index)));
}

EditNoteState _modifyTaskReducer(
  EditNoteState state,
  ModifyTaskAction action,
) {
  final newState = state.copyWith();
  newState.note.tasks[action.index] = action.task;
  return newState;
}
