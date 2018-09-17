import 'package:flutter/material.dart';


class SummariesView extends StatelessWidget {
  final List<String> messages;

  const SummariesView({Key key, @required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getSummaryBody();
  }

  Widget _getSummaryBody() {
    var firstMessage = "No message";
    if(messages != null && messages.isNotEmpty)
      firstMessage = messages[0];

    var secondMessage = "No message";
    if(messages != null && messages.isNotEmpty)
      secondMessage = messages[1];

    var thirdMessage = "No message";
    if(messages != null && messages.isNotEmpty)
      thirdMessage = messages[2];

    return ListView(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: Icon(Icons.person),
          title: Text('FIRST USER'),
          subtitle: Text(firstMessage),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: Icon(Icons.person),
          title: Text('SECOND USER'),
          subtitle: Text(secondMessage),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: Icon(Icons.person),
          title: Text('THIRD USER'),
          subtitle: Text(thirdMessage),
        ),
      ],
    );
  }
}
