import 'package:redux/redux.dart';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

final appStateReducer = combineReducers<AppState>([
  TypedReducer<AppState, StartSimulationAction>(_onSimulationStart),
  TypedReducer<AppState, StopSimulationAction>(_onSimulationStop),
  TypedReducer<AppState, SummaryReadyAction>(_onSummaryReady),
]);

AppState _onSimulationStart(AppState state, StartSimulationAction action) {
  return AppState(
      summaryMessages: state.summaryMessages, isSimulationRunning: true);
}

AppState _onSimulationStop(AppState state, StopSimulationAction action) {
  print("OnSimulationStop reducer");
  return AppState(
      summaryMessages: null, isSimulationRunning: false);
}

AppState _onSummaryReady(AppState state, SummaryReadyAction action) {
  print('onSummaryReady reducer');
  return AppState(
      summaryMessages: action.messages,
      isSimulationRunning: state.isSimulationRunning);
}
