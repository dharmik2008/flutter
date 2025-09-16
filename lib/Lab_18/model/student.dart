class Student {
  int? id;
  String name;
  String enrollment;
  String semester;
  String branch;
  String mobile;

  Student({
    this.id,
    required this.name,
    required this.enrollment,
    required this.semester,
    required this.branch,
    required this.mobile,
  });

  // Convert Student to Map for database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'enrollment': enrollment,
      'semester': semester,
      'branch': branch,
      'mobile': mobile,
    };
  }

  // Create Student from Map
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      enrollment: map['enrollment'],
      semester: map['semester'],
      branch: map['branch'],
      mobile: map['mobile'],
    );
  }
}
