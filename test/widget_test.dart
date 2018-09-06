// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_presentation/models/app_state.dart';
import 'package:flutter_presentation/redux/middleware/app_state_middleware.dart';
import 'package:flutter_presentation/redux/reducers/app_state_reducer.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_presentation/main.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final store = new Store<AppState>(appStateReducer,
        initialState:
            new AppState(text1: 'Initial State', isLoading: false, error: null),
        middleware: [AppStateMiddleware('https://dev-api.auer.biz/')]);
        var configuredApp = new AppConfig(
    appName: 'Flutter Presentation INT',
    flavorName: 'integration',
    apiBaseUrl: 'https://int-api.auer.biz/',
    child: new MyApp(
      store: store,
    ),
  );
    await tester.pumpWidget(configuredApp);

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
