import 'package:flutter/material.dart';
import 'package:gonote/data/constants/text_styles.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    Key? key,
    this.done = false,
    this.content = "This is a task",
    this.id = -1,
    this.onTap,
    this.onTextChange,
  }) : super(key: key);
  final bool done;
  final String content;
  final int id;
  final Function(int, bool)? onTap;
  final Function(int, String)? onTextChange;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _textController.addListener(_onTextChange);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: widget.done,
          onChanged: (checked) =>
              widget.onTap?.call(widget.id, checked ?? false),
        ),
        Expanded(
          child: TextField(
            focusNode: _focusNode,
            controller: _textController,
            style: TextStyles.normalText,
            decoration: const InputDecoration.collapsed(hintText: ''),
          ),
        )
      ],
    );
  }

  _onTextChange() => widget.onTextChange?.call(widget.id, _textController.text);

  _onFocusChange() {
    if (!_focusNode.hasFocus) {
      // Only trigger when not focus text field again
      _onTextChange();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
