import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/summaries_view.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        print(vm.summaryMessages);
        return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: SummariesView(
              messages: vm.summaryMessages,
            ),
            floatingActionButton: FloatingActionButton(key: Key("triggerSimulationFab"),
              onPressed: vm.isSimulationRunning
                  ? vm.stopSimulation
                  : vm.startSimulation,
              child: vm.isSimulationRunning
                  ? Icon(Icons.stop)
                  : Icon(Icons.play_arrow),
            ));
      },
    );
  }
}

class _ViewModel {
  final bool isSimulationRunning;
  final List<String> summaryMessages;
  final Function startSimulation;
  final Function stopSimulation;

  _ViewModel(
      {@required this.isSimulationRunning,
      @required this.summaryMessages,
      @required this.startSimulation,
      @required this.stopSimulation});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isSimulationRunning: store.state.isSimulationRunning,
        summaryMessages: store.state.summaryMessages,
        startSimulation: () => store.dispatch(StartSimulationAction()),
        stopSimulation: () => store.dispatch(StopSimulationAction()));
  }
}
