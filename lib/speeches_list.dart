import 'package:conferences/conference_singleton.dart';
import 'package:conferences/models/employee.dart';
import 'package:flutter/material.dart';

import 'models/speech.dart';

class SpeechesList extends StatelessWidget {
  List<Speech> speeches = [];
  int idConference = 0;

  SpeechesList(int setIdConference, List<Speech> setSpeeches, {super.key}) {
    idConference = setIdConference;
    speeches = setSpeeches;
  }

  Employee _findEmployee(int employeeId) {
    var conference = ConferenceSingleton().conferences.firstWhere((element) => element.id == idConference);
    return conference.employees.firstWhere((element) => element.id == employeeId);
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = speeches[index];

    return Card(
        child: ListTile(
          title: Text(
            item.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            _findEmployee(item.employeeId).name
          ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Speeches list'),
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
        ),
        body: ListView.builder(
            itemCount: speeches.length,
            itemBuilder: (context, index) => itemBuilder(context, index),
        )
      )
    );
  }
}