class Employee {
  Employee({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    name: json["name"],
  );
}