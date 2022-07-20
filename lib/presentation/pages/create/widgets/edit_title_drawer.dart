import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gonote/data/constants/colors.dart';
import 'package:gonote/data/constants/text_styles.dart';
import 'package:gonote/utils/screen_size.dart';

class EditTitleDrawer extends StatelessWidget {
  const EditTitleDrawer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: MediaQuery.of(context).size.height / 6,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: DefaultTextStyle(
          style: TextStyles.noteTitle.copyWith(
            fontSize: 18,
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
