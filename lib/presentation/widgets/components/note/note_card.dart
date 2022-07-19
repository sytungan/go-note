import 'package:flutter/material.dart';
import 'package:gonote/data/constants/colors.dart';
import 'package:gonote/data/constants/text_styles.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    this.title = "This is title",
    this.content = "This is content",
    this.date = "20/01/2022",
    this.id = -1,
    this.onTap,
  }) : super(key: key);

  final int id;
  final String title;
  final String content;
  final String date;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: AppColors.gainsboro),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyles.noteTitle),
            const SizedBox(height: 6),
            Text(date, style: TextStyles.subDescription),
            const SizedBox(height: 10),
            Text(content, style: TextStyles.noteContent)
          ],
        ),
      ),
    );
  }
}
