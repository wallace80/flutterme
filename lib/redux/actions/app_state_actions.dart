import 'package:flutter_presentation/models/app_state.dart';

class RetrieveAppStateAction {}

class AppStateSuccessAction {
  final AppState appState;
  AppStateSuccessAction(this.appState);
}

class AppStateError {
  final Exception error;

  AppStateError(this.error);
}
