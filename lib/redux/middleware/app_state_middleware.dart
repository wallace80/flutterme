import 'package:flutter_presentation/models/app_state.dart';
import 'package:flutter_presentation/redux/actions/app_state_actions.dart';
import 'package:redux/redux.dart';

class AppStateMiddleware extends MiddlewareClass {
  final String url;

  AppStateMiddleware(this.url);
  @override
  void call(Store store, action, NextDispatcher next) {
    if (action is RetrieveAppStateAction) {
      print('In AppStateMiddleware[RetrieveAppStateAction]');
      store.dispatch(new AppStateSuccessAction(new AppState(
          text1: 'Some Text from Middleware', error: null, isLoading: false)));
    }
    next(action);
  }
}
