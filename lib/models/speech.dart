class Speech {
  Speech({
    required this.id,
    required this.name,
    required this.employeeId,
  });

  int id;
  String name;
  int employeeId;

  factory Speech.fromJson(Map<String, dynamic> json) => Speech(
    id: json["id"],
    name: json["name"],
    employeeId: json["employee_id"],
  );
}