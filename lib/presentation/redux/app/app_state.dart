import 'package:flutter/material.dart';
import 'package:gonote/presentation/redux/tab/tab.state.dart';

@immutable
class AppState {
  final bool loading;
  final String error;
  final TabState tab;

  const AppState({
    this.loading = false,
    this.error = '',
    this.tab = const TabState(),
  });

  factory AppState.initial() => const AppState();

  AppState copyWith({TabState? newTab}) => AppState(tab: newTab ?? tab);

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          error == other.error;

  @override
  int get hashCode =>
      super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

  @override
  String toString() => "AppState { loading: $loading,  error: $error}";
}
