import 'package:flutter/material.dart';
import 'package:gonote/presentation/pages/app/widgets/app_navigation_bar.dart';
import 'package:gonote/presentation/pages/pages.dart';
import 'widgets/widgets.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool shouldShowRail = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Row(
        children: [
          shouldShowRail ? AppNavigationBars.navigationRail : Container(),
          Expanded(
            child: IndexedStack(
              index: 0,
              children: const [AllPage(), CompletePage(), InCompletePage()],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          shouldShowRail ? null : AppNavigationBars.navigationBottom,
    );
  }
}
