class RoleModel {
  final String id;
  final String name; // Role name (Owner, Admin, Manager)
  final List<String> permissions; // e.g., ['read', 'write', 'create']
  final List<String> assignedUsers; // User IDs assigned to this role
  final String token; // Authentication token for role-based access

  RoleModel({
    required this.id,
    required this.name,
    required this.permissions,
    required this.assignedUsers,
    required this.token,
  });

  // Convert JSON to RoleModel
  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      permissions: List<String>.from(json['permissions'] ?? []),
      assignedUsers: List<String>.from(json['assignedUsers'] ?? []),
      token: json['token'] ?? '',
    );
  }

  // Convert RoleModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'permissions': permissions,
      'assignedUsers': assignedUsers,
      'token': token,
    };
  }

  // Check if role has a specific permission
  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }

  // Validate token (Example: Check if it's not empty)
  bool isValidToken() {
    return token.isNotEmpty;
  }

  // Clone role with modifications
  RoleModel copyWith({
    String? id,
    String? name,
    List<String>? permissions,
    List<String>? assignedUsers,
    String? token,
  }) {
    return RoleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      permissions: permissions ?? this.permissions,
      assignedUsers: assignedUsers ?? this.assignedUsers,
      token: token ?? this.token,
    );
  }
}
