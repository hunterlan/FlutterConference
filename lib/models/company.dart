import 'employee.dart';

class Company {
  Company({
    required this.id,
    required this.name
  });

  int id;
  String name;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"]
  );
}