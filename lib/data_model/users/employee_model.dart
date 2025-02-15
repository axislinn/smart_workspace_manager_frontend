class Employee {
  final String id;
  final String name;
  final String email;
  final String role;
  final String token;
  final String department;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'employee',
    required this.token,
    required this.department,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? 'employee',
      token: json['token'] ?? '',
      department: json['department'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name': name,
      'email': email,
      'role': role,
      'token': token,
      'department': department,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
