import 'package:gonote/presentation/redux/app/app_action.dart';
import 'package:redux/redux.dart';
import 'app_state.dart';

final appReducer = combineReducers<AppState>([TypedReducer(_tabReducer)]);

AppState _tabReducer(AppState state, TabChangeAction action) {
  return AppState(
    loading: state.loading,
    error: state.error,
    tabIndex: action.index,
  );
}
