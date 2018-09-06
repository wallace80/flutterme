import 'package:flutter/material.dart';
import 'package:flutter_presentation/app_config.dart';
import 'package:flutter_presentation/main.dart';
import 'package:flutter_presentation/models/app_state.dart';
import 'package:flutter_presentation/redux/middleware/app_state_middleware.dart';
import 'package:flutter_presentation/redux/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store<AppState>(appStateReducer,
      initialState:
          new AppState(text1: 'Initial State', isLoading: false, error: null),
      middleware: [AppStateMiddleware('https://api.auer.biz/')]);
  var configuredApp = new AppConfig(
    appName: 'Flutter Presentation PROD',
    flavorName: 'production',
    apiBaseUrl: 'https://api.auer.biz/',
    child: new MyApp(
      store: store,
    ),
  );

  runApp(configuredApp);
}
