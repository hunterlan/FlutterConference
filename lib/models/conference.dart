import 'employee.dart';
import 'company.dart';
import 'speech.dart';

class Conference {
  int id = -1;
  String name = "";
  String description = "";
  DateTime date = DateTime(0);
  List<Employee> employees = [];
  List<Company> companies = [];
  List<Speech> speeches = [];

  Conference({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.employees,
    required this.companies,
    required this.speeches,
  });

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    employees: List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
    companies: List<Company>.from(json["companies"].map((x) => Company.fromJson(x))),
    speeches: List<Speech>.from(json["speeches"].map((x) => Speech.fromJson(x))),
  );
}