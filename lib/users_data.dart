import 'dart:math';

import 'package:rxdart/rxdart.dart';

Observable<String> firstUserMessages() {
  // Readme: Each user sends a message every 1-2 seconds, randomly.
  // First second is established with periodic.
  // Next second may be added with delay
  return Observable.periodic(Duration(seconds: 1))
      .concatMap((i) => Observable.just(getRandomMessage())
          .delay(randomDuration('firstUser')))
      .timeInterval()
      .concatMap((time) {
    print(time.interval);
    return Observable.just(time.value);
  });
}

Observable<String> secondUserMessages() =>
    Observable.periodic(Duration(seconds: 1)).concatMap((i) =>
        Observable.just(getRandomMessage())
            .delay(randomDuration('secondUserMessages')));

Observable<String> thirdUserMessages() =>
    Observable.periodic(Duration(seconds: 1)).concatMap((i) =>
        Observable.just(getRandomMessage())
            .delay(randomDuration('thirdUserMessages')));

Duration randomDuration(String user) {
  // May generate additional 1 second for delay
  var seconds = Random().nextInt(2);
  print('Period of $user: ${seconds + 1}');
  return Duration(seconds: seconds);
}

String getRandomMessage() => messages[Random().nextInt(messages.length)];

var messages = [
  "Hi, how's it going?",
  "Are you buzy tomorrow?",
  "Going to attend cinema next week. I'll not call you.",
  "Some text that can be similar to friends text message",
  "Bye dude, you are forever alone",
  "Another one message",
  "Message about a lack of my imigination"
];

Observable<List<String>> startSimulation() {
  // 1) Summary object should not be emitted more often than every 1 second
  // I use debounce to achieve that
  // 4) All 3 users must emit at least one message before 1 summary object is ever sent to the app.
  // combineLatest3 will emit first item only if all three items a ready
  // 2) Summary object should only be emitted when one of the users sends a new message
  // This is also achieved with using combineLatest
  return Observable.combineLatest3(firstUserMessages(), secondUserMessages(),
          thirdUserMessages(), (String a, String b, String c) => [a, b, c])
      .debounce(Duration(seconds: 1));
}
