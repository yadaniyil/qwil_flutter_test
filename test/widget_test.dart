// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qwil_flutter_test/main.dart';

/// Can't run widget tests because of flutter exception that has open issue on GitHub
/// ══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
/// The following assertion was thrown running a test:
/// A periodic Timer is still running even after the widget tree was disposed.
/// 'package:flutter_test/src/binding.dart': Failed assertion: line 923 pos 7:
/// '_currentFakeAsync.periodicTimerCount == 0'

void main() {
  testWidgets('Simulation starts test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that there is no summary yet
    expect(find.text('No message'), findsWidgets);

    // Tap the FAB and trigger a simulation.
    await tester.tap(find.byKey(Key("triggerSimulationFab")));
    await tester.pump(Duration(milliseconds: 400));

    // Verify that button's icon changed to 'Stop'
    expect(find.byIcon(Icons.stop), findsOneWidget);
  });
}
