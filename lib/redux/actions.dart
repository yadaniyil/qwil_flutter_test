
class StartSimulationAction {}

class StopSimulationAction {}

class SummaryReadyAction {
  final List<String> messages;

  SummaryReadyAction(this.messages);

  @override
  String toString() => "messages: $messages";

}
