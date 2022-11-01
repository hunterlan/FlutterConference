import 'company.dart';
import 'speech.dart';

class Conference {
  int id = -1;
  String name = "";
  String description = "";
  DateTime date = DateTime(0);
  List<Company> companies = [];
  List<Speech> speeches = [];

  Conference({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.companies,
    required this.speeches,
  });

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    companies: List<Company>.from(json["companies"].map((x) => Company.fromJson(x))),
    speeches: List<Speech>.from(json["speeches"].map((x) => Speech.fromJson(x))),
  );
}