import 'dart:convert';
import 'dart:io';

import 'models/conference.dart';

class ConferenceSingleton {
  static final ConferenceSingleton _singleton = ConferenceSingleton._internal();

  factory ConferenceSingleton() => _singleton;

  ConferenceSingleton._internal() {
    loadFile();
  } // private constructor
  static ConferenceSingleton get shared => _singleton;

  List<Conference> conferences = [];

  void loadFile() {
    String content = File('./assets/data/conferences.json').readAsStringSync();
    var jsonContent = json.decode(content);
    conferences = List<Conference>.from(jsonContent["conferences"].map((x) => Conference.fromJson(x)));
  }
}