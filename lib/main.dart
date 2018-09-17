import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qwil_flutter_test/home_screen.dart';
import 'package:redux/redux.dart';

import 'package:qwil_flutter_test/redux/reducers.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:qwil_flutter_test/redux/epics.dart';
import 'package:redux_logging/redux_logging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var epicMiddleware = EpicMiddleware(summariesEpic);
    return StoreProvider<AppState>(
        store: Store<AppState>(
          appStateReducer,
          initialState: AppState.initial(),
          middleware: [epicMiddleware, LoggingMiddleware.printer()]
        ),
        child: MaterialApp(
          title: 'Forever Alone',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(title: 'Forever Alone'),
        ));
  }
}
