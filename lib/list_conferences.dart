import 'dart:convert';
import 'dart:io';
import 'package:conferences/conference_details.dart';
import 'package:conferences/conference_singleton.dart';
import 'package:flutter/material.dart';

import 'models/conference.dart';

class ListConferences extends StatelessWidget {
  List<Conference> conferences = ConferenceSingleton().conferences;

  void itemInvoked(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConferenceDetails(conferences[index]))
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = conferences[index];

    return Card(
        child: ListTile(
            title: Text(
              item.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              item.date.toString().substring(0, 10)
            ),
            onTap: () => itemInvoked(context, index),
    ));
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