import 'dart:convert';
import 'dart:io';
import 'package:conferences/conference_details.dart';
import 'package:flutter/material.dart';

import 'models/conference.dart';

class ListConferences extends StatelessWidget {
  List<Conference> conferences = [];

  ListConferences({super.key}) {
    loadFile();
  }

  void loadFile() {
    String content = File('./assets/data/conferences.json').readAsStringSync();
    var jsonContent = json.decode(content);
    conferences = List<Conference>.from(jsonContent["conferences"].map((x) => Conference.fromJson(x)));
  }

  void itemInvoked(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConferenceDetails(conferences[index]))
    );
  }

  ListTile itemBuilder(BuildContext context, int index) {
    final item = conferences[index];

    return ListTile(
      title: Text(
        item.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        item.date.toString().substring(0, 10)
      ),
      onTap: () => itemInvoked(context, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: conferences.length,
          itemBuilder: (context, index) => itemBuilder(context, index),
        )
      ),
    );
  }
}