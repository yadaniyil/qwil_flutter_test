import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<String> summaryMessages;
  final bool isSimulationRunning;

  AppState({this.summaryMessages, this.isSimulationRunning});

  factory AppState.initial() {
    return AppState(summaryMessages: const [], isSimulationRunning: false);
  }

  @override
  String toString() {
    return 'AppState{isSimulationRunning: $isSimulationRunning,'
        'summaryMessages: $summaryMessages}';
  }
}
