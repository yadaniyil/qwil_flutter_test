import 'dart:async';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/users_data.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> summariesEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  var returnValue = Observable(actions)
      .ofType(TypeToken<StartSimulationAction>())
      .switchMap((i) {
    return startSimulation()
//        .timeout(Duration(seconds: 10))
        .map((messages) => SummaryReadyAction(messages))
        .takeUntil(actions.where((action) => action is StopSimulationAction));
  });

  return returnValue;
}
