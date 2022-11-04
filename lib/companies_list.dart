import 'package:flutter/material.dart';

import 'conference_singleton.dart';
import 'models/company.dart';

class CompaniesList extends StatelessWidget {
  List<Company> companies = [];
  int conferenceId = 0;

  CompaniesList(List<Company> setCompanies, int setConferenceId) {
    companies = setCompanies;
    conferenceId = setConferenceId;
  }

  int _getCountEmployees(int companyId) {
    var conference = ConferenceSingleton().conferences.firstWhere((element) => element.id == conferenceId);
    return conference.employees.where((emp) => emp.companyId == companyId).length;
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = companies[index];

    return Card(
        child: ListTile(
          title: Text(
            item.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
             "Count employees: ${_getCountEmployees(item.id)}"
          ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Companies list'),
            leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
          ),
        body: ListView.builder(
            itemCount: companies.length,
            itemBuilder: itemBuilder
        ),
      ),
    );
  }

}