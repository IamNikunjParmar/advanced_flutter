class Employee {
  int id;
  String name;

  Employee(this.id, this.name);

  factory Employee.fromMap({required Map data}) =>
      Employee(data['id'], data['name']);

  Map<String, dynamic> get toMap => {
        'id': id,
        'name': name,
      };
}
