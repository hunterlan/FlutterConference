class Employee {
  Employee({
    required this.id,
    required this.name,
    required this.companyId
  });

  int id;
  String name;
  int companyId;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    name: json["name"],
    companyId: json["company_id"]
  );
}