class Admin {
  final String id;
  final String name;
  final String email;
  final String role;
  final String token;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  Admin({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'admin',
    required this.token,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? 'admin',
      token: json['token'] ?? '',
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
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'token': token,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
