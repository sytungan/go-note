import 'package:gonote/presentation/redux/tab/tab.reducer.dart';

import 'app_state.dart';

AppState appReducer(AppState state, action) {
  return state.copyWith(
    newTab: tabReducer(state.tab, action),
  );
}
