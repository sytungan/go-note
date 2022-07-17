class AppAction {
  @override
  String toString() {
    return 'AppAction { }';
  }
}

class AppSuccessAction {
  final int isSuccess;

  AppSuccessAction({required this.isSuccess});
  @override
  String toString() {
    return 'AppSuccessAction { isSuccess: $isSuccess }';
  }
}

class AppFailedAction {
  final String error;

  AppFailedAction({required this.error});

  @override
  String toString() {
    return 'AppFailedAction { error: $error }';
  }
}
