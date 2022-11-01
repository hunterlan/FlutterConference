import 'package:conferences/models/conference.dart';
import 'package:flutter/material.dart';

class ConferenceDetails extends StatelessWidget {
  Conference currentConference;

  ConferenceDetails(this.currentConference, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Conference details'),
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: <Widget>[
            Text(currentConference.name),
            Text(currentConference.date.toString().substring(0, 10)),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(currentConference.description),
            )
          ],
        ),
      )
    );
  }
  
}