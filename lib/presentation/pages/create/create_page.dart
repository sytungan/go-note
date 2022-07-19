import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gonote/data/constants/colors.dart';
import 'package:gonote/data/constants/text_styles.dart';
import 'package:gonote/presentation/widgets/components/task_item/task_item.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  Widget _itemBuilder(BuildContext context, int index) {
    return TaskItem();
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return SizedBox(height: 6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.5,
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Create new note',
          style: TextStyles.appBarTitle,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
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
                  itemCount: 20,
                ),
              ),
              const Divider(),
              TextField(
                style: TextStyles.normalText,
                decoration: InputDecoration.collapsed(
                    hintStyle: TextStyles.normalText
                        .copyWith(color: AppColors.mediumGray),
                    hintText: 'About this note'),
                maxLines: 4,
              ),
            ]),
      ),
    );
  }
}
