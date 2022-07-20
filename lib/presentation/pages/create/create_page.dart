import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gonote/data/constants/colors.dart';
import 'package:gonote/data/constants/text_styles.dart';
import 'package:gonote/data/entitiers/note_entity.dart';
import 'package:gonote/data/entitiers/task_entity.dart';
import 'package:gonote/presentation/redux/edit_note/edit_note.action.dart';
import 'package:gonote/presentation/redux/edit_note/edit_note.reducer.dart';
import 'package:gonote/presentation/redux/edit_note/edit_note.state.dart';
import 'package:gonote/presentation/widgets/components/task_item/task_item.dart';
import 'package:redux/redux.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  Widget _itemBuilder(BuildContext context, int index) {
    final task = _note.tasks[index];
    return TaskItem(
      idx: index,
      done: task.done,
      content: task.content,
      onTap: (idx, done) {
        _vm.onModifyTask.call(idx, task.copyWith(newDone: done));
      },
      onTextChange: (idx, text) {
        _vm.onModifyTask.call(idx, task.copyWith(newContent: text));
      },
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 6);
  }

  List<PopupMenuEntry<AppBarMenu>> _itemBuilderPopupMenu(BuildContext context) {
    return AppBarMenu.values
        .map((menuItem) => PopupMenuItem<AppBarMenu>(
              value: menuItem,
              child: Text(menuItem.title, style: TextStyles.normalText),
            ))
        .toList();
  }

  _onSelectPopupItem(AppBarMenu item) {
    switch (item) {
      case AppBarMenu.save:
        Navigator.of(_context).pop();
        break;
      case AppBarMenu.exit:
        Navigator.of(_context).pop();
        break;
    }
  }

  _onAddTask() {
    _vm.onAddTask.call();
  }

  late BuildContext _context;

  late NoteEntity _note;

  late _EditNoteViewModel _vm;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return StoreProvider(
      store: Store<EditNoteState>(
        editNoteReducer,
        initialState: EditNoteState.initial(),
      ),
      child: StoreConnector<EditNoteState, _EditNoteViewModel>(
          converter: _EditNoteViewModel.fromStore,
          builder: (context, vm) {
            _note = vm.note;
            _vm = vm;
            TextEditingController titleTextController =
                TextEditingController(text: _note.title);
            TextEditingController contentTextController =
                TextEditingController(text: _note.content);

            FocusNode titleFocusNode = FocusNode()
              ..addListener(() => vm.onChangeTitle(titleTextController.text));

            FocusNode contentFocusNode = FocusNode()
              ..addListener(
                  () => vm.onChangeContent(contentTextController.text));

            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                elevation: 0.5,
                leadingWidth: 60,
                leading: InkWell(
                  child: const Icon(Icons.arrow_back_ios),
                  onTap: () => Navigator.pop(context),
                ),
                title: TextFormField(
                  controller: titleTextController,
                  focusNode: titleFocusNode,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Create new note',
                    hintStyle: TextStyles.appBarTitle
                        .copyWith(color: AppColors.mediumGray),
                  ),
                  style: TextStyles.appBarTitle,
                ),
                actions: [
                  IconButton(
                    onPressed: _onAddTask,
                    icon: const Icon(Icons.task),
                    tooltip: "Add a task",
                  ),
                  PopupMenuButton(
                    itemBuilder: _itemBuilderPopupMenu,
                    onSelected: _onSelectPopupItem,
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          separatorBuilder: _separatorBuilder,
                          itemBuilder: _itemBuilder,
                          itemCount: _note.tasks.length,
                        ),
                      ),
                      const Divider(),
                      TextFormField(
                        controller: contentTextController,
                        focusNode: contentFocusNode,
                        style: TextStyles.normalText,
                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyles.normalText
                              .copyWith(color: AppColors.mediumGray),
                          hintText: 'About this note',
                        ),
                        maxLines: 4,
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}

class _EditNoteViewModel {
  final NoteEntity note;
  final Function(String) onChangeTitle;
  final Function(String) onChangeContent;
  final Function() onAddTask;
  final Function(int) onRemoveTask;
  final Function(int, TaskEntity) onModifyTask;

  _EditNoteViewModel({
    required this.onChangeContent,
    required this.onAddTask,
    required this.onRemoveTask,
    required this.onModifyTask,
    required this.note,
    required this.onChangeTitle,
  });

  static _EditNoteViewModel fromStore(Store<EditNoteState> store) {
    return _EditNoteViewModel(
      note: store.state.note,
      onChangeTitle: (title) => store.dispatch(TitleChangeAction(title)),
      onChangeContent: (content) =>
          store.dispatch(ContentChangeAction(content)),
      onAddTask: () => store.dispatch(const AddTaskAction(TaskEntity())),
      onRemoveTask: (idx) => store.dispatch(RemoveTaskAction(idx)),
      onModifyTask: (idx, task) => store.dispatch(ModifyTaskAction(idx, task)),
    );
  }
}

enum AppBarMenu {
  save("Save"),
  exit("Exit");

  const AppBarMenu(this.title);
  final String title;
}
