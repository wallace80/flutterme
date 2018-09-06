class AppState {
  final String text1;
  final bool isLoading;
  final Exception error;

  AppState({this.text1, this.isLoading, this.error});

  AppState copyWith({String text1, bool loading, Exception error}) {
    return AppState(
        text1: text1 ?? this.text1,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }

  factory AppState.loading() => AppState(isLoading: true);

  @override
  int get hashCode => text1.hashCode ^ isLoading.hashCode ^ error.hashCode;

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          text1 == other.text1 &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  String toString() {
    return 'AppState{text1:$text1,isLoading:$isLoading,error:$error}';
  }
}
