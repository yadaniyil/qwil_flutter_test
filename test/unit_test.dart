import 'package:qwil_flutter_test/users_data.dart';
import 'package:test/test.dart';

void main() {
  group('Each user sends a message every 1-2 seconds, randomly.', () {
    test('firstUser messages interval test', () async {
      int lastInterval = -1;
      Stopwatch stopwatch = new Stopwatch()..start();

      firstUserMessages().take(messages.length).listen(
          expectAsync1((String result) {
            expect(result, anyOf(messages));

            if (lastInterval != -1) {
              expect(stopwatch.elapsed.inSeconds - lastInterval >= 1, true);
              expect(stopwatch.elapsed.inSeconds - lastInterval <= 2, true);
            }

            lastInterval = stopwatch.elapsed.inSeconds;
          }, count: messages.length),
          onDone: stopwatch.stop);
    });

    test('secondUser messages interval test', () async {
      int lastInterval = -1;
      Stopwatch stopwatch = new Stopwatch()..start();

      secondUserMessages().take(messages.length).listen(
          expectAsync1((String result) {
            expect(result, anyOf(messages));

            if (lastInterval != -1) {
              expect(stopwatch.elapsed.inSeconds - lastInterval >= 1, true);
              expect(stopwatch.elapsed.inSeconds - lastInterval <= 2, true);
            }

            lastInterval = stopwatch.elapsed.inSeconds;
          }, count: messages.length),
          onDone: stopwatch.stop);
    });

    test('thirdUser messages interval test', () async {
      int lastInterval = -1;
      Stopwatch stopwatch = new Stopwatch()..start();

      thirdUserMessages().take(messages.length).listen(
          expectAsync1((String result) {
            expect(result, anyOf(messages));

            if (lastInterval != -1) {
              expect(stopwatch.elapsed.inSeconds - lastInterval >= 1, true);
              expect(stopwatch.elapsed.inSeconds - lastInterval <= 2, true);
            }

            lastInterval = stopwatch.elapsed.inSeconds;
          }, count: messages.length),
          onDone: stopwatch.stop);
    });
  });

  test('1) Summary object should not be emitted more often than every 1 second',
      () async {
    int lastInterval = -1;
    Stopwatch stopwatch = new Stopwatch()..start();

    startSimulation().take(messages.length).listen(
        expectAsync1((List<String> result) {
          if (lastInterval != -1)
            expect(stopwatch.elapsed.inSeconds - lastInterval >= 1, true);

          lastInterval = stopwatch.elapsed.inSeconds;
        }, count: messages.length),
        onDone: stopwatch.stop);
  });

  test(
      '4) All 3 users must emit at least one message before 1 summary object is ever sent to the app.',
      () async {
    startSimulation()
        .take(messages.length)
        .listen(expectAsync1((List<String> result) {
          expect(result, isNotNull);
          expect(result.length, 3);
          expect(result[0], isNotEmpty);
          expect(result[1], isNotEmpty);
          expect(result[2], isNotEmpty);
        }, count: messages.length));
  });
}
