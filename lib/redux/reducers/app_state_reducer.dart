import 'package:flutter_presentation/models/app_state.dart';
import 'package:flutter_presentation/redux/actions/app_state_actions.dart';
import 'package:redux/redux.dart';

final appStateReducer = combineReducers<AppState>([
  TypedReducer<AppState, RetrieveAppStateAction>(_loading),
  TypedReducer<AppState, AppStateError>(_error),
  TypedReducer<AppState, AppStateSuccessAction>(_success)
]);

AppState _loading(AppState state, RetrieveAppStateAction action) {
  return AppState.loading();
}

AppState _error(AppState state, AppStateError action) =>
    state.copyWith(loading: false, error: action.error);

AppState _success(AppState state, AppStateSuccessAction action) =>
    action.appState;
