import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gonote/presentation/pages/app/widgets/app_navigation_bar.dart';
import 'package:gonote/presentation/pages/create/create_page.dart';
import 'package:gonote/presentation/pages/pages.dart';
import 'package:gonote/presentation/pages/photo/camera_page.dart';
import 'package:gonote/presentation/redux/app/app_state.dart';
import 'package:gonote/presentation/redux/tab/tab.action.dart';
import 'package:gonote/presentation/redux/tab/tab.state.dart';
import 'package:gonote/utils/screen_size.dart';
import 'package:redux/redux.dart';
import 'widgets/widgets.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool shouldShowRail = screenSize(context) != AppScreenSizes.small &&
        screenSize(context) != AppScreenSizes.normal;

    return StoreConnector<AppState, _AppViewModel>(
        converter: _AppViewModel.fromStore,
        builder: (context, vm) {
          final currentTabIndex = vm.tab.index;
          final onChangeTab = vm.onTabSelected;

          return Scaffold(
            body: Row(
              children: [
                shouldShowRail
                    ? NavigationRail(
                        destinations:
                            AppNavigationBars.navigationRailDestinations,
                        selectedIndex: currentTabIndex,
                        onDestinationSelected: onChangeTab,
                      )
                    : Container(),
                Expanded(
                  child: IndexedStack(
                    index: currentTabIndex,
                    children: const [
                      AllPage(),
                      CompletePage(),
                      InCompletePage()
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: shouldShowRail
                ? null
                : BottomNavigationBar(
                    items: AppNavigationBars.navigationBottomItems,
                    currentIndex: currentTabIndex,
                    onTap: onChangeTab,
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CameraPage()));
              },
              child: const Icon(Icons.note_add),
            ),
          );
        });
  }
}

class _AppViewModel {
  final TabState tab;
  final Function(int) onTabSelected;

  _AppViewModel({
    required this.tab,
    required this.onTabSelected,
  });

  static _AppViewModel fromStore(Store<AppState> store) {
    return _AppViewModel(
      tab: store.state.tab,
      onTabSelected: (index) {
        store.dispatch(TabChangeAction(index));
      },
    );
  }
}
