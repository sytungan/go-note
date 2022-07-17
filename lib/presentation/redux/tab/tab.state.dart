class TabState {
  final int index;

  const TabState({this.index = 0});

  factory TabState.initial() => const TabState();

  TabState copyWith({int? newIndex}) => TabState(index: newIndex ?? index);

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TabState &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => super.hashCode ^ runtimeType.hashCode ^ index.hashCode;

  @override
  String toString() => "TabState { index: $index }";
}
