import 'employee.dart';

class Company {
  Company({
    required this.id,
    required this.name,
    required this.employees,
  });

  int id;
  String name;
  List<Employee> employees;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    employees: List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
  );
}