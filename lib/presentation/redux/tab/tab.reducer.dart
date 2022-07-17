import './tab.action.dart';
import 'package:redux/redux.dart';
import './tab.state.dart';

final tabReducer = combineReducers<TabState>([TypedReducer(_tabChangeReducer)]);

TabState _tabChangeReducer(TabState state, TabChangeAction action) {
  return state.copyWith(newIndex: action.index);
}
