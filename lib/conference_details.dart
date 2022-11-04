import 'package:conferences/models/conference.dart';
import 'package:conferences/speeches_list.dart';
import 'package:flutter/material.dart';

class ConferenceDetails extends StatelessWidget {
  Conference currentConference;

  ConferenceDetails(this.currentConference, {super.key});

  void seeListSpeeches(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SpeechesList(currentConference.id, currentConference.speeches)));
  }

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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // use whichever suits your need
                children: [
                  ElevatedButton(onPressed: () => seeListSpeeches(context), child: const Text('List of speeches')),
                  ElevatedButton(onPressed: null, child: Text('List of companies'))
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  
}