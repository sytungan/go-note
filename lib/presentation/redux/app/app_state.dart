class AppState {
  final bool loading;
  final String error;
  final int tabIndex;

  const AppState({
    this.loading = false,
    this.error = '',
    this.tabIndex = 0,
  });

  factory AppState.initial() => const AppState();

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
