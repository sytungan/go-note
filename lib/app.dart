import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gonote/presentation/redux/app/app_state.dart';
import 'package:redux/redux.dart';
import 'config/scroll_behavior.dart';
import 'config/themes/app_themes.dart';
import 'presentation/pages/pages.dart';
import 'presentation/redux/app/app_reducer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: Store<AppState>(
          appReducer,
          initialState: AppState.initial(),
        ),
        child: MaterialApp(
          scrollBehavior: AppScrollBehavior(),
          theme: AppThemes.light,
          home: const AppPage(),
        ));
  }
}
