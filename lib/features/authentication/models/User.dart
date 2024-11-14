class User {
  final String id;
  final String name;
  final String email;
  final String hashedPassword;
  final bool status;
  final String role;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.hashedPassword,
    required this.status,
    required this.role,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      hashedPassword: json['hashedPassword'],
      status: json['status'],
      role: json['role'],
      phone: json['phone'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Method to convert a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'hashedPassword': hashedPassword,
      'status': status,
      'role': role,
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  void printInfo() {
    print("User Info:");
    print("ID: $id");
    print("Name: $name");
    print("Email: $email");
    print("Status: $status");
    print("Role: $role");
    print("Phone: $phone");
    print("Created At: $createdAt");
    print("Updated At: $updatedAt");
  }
}
