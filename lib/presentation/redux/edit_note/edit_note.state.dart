import 'package:gonote/data/entitiers/note_entity.dart';

class EditNoteState {
  final NoteEntity note;

  const EditNoteState({this.note = const NoteEntity()});

  factory EditNoteState.initial() => const EditNoteState();

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is EditNoteState &&
          runtimeType == other.runtimeType &&
          note == other.note;

  EditNoteState copyWith({NoteEntity? newNote}) =>
      EditNoteState(note: newNote ?? note);

  @override
  int get hashCode => super.hashCode ^ runtimeType.hashCode ^ note.hashCode;

  @override
  String toString() => "EditNoteState { ${note.title} }";
}
