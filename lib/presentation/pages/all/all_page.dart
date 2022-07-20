import 'package:flutter/material.dart';
import 'package:gonote/presentation/widgets/dialogs/error_dialog.dart';
import 'package:gonote/presentation/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gonote/utils/screen_size.dart';

class AllPage extends StatelessWidget {
  const AllPage({Key? key}) : super(key: key);

  int _crossAxisCount(BuildContext context) {
    switch (screenSize(context)) {
      case AppScreenSizes.small:
        return 1;
      case AppScreenSizes.normal:
        return 2;
      case AppScreenSizes.medium:
        return 3;
      case AppScreenSizes.large:
        return 4;
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return NoteCard(
      onTap: (id) => ErrorDialog.show(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ErrorDialog.show(context: context);

    return Scaffold(
      body: MasonryGridView.builder(
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemCount: 20,
        itemBuilder: _itemBuilder,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount(context)),
      ),
    );
  }
}
