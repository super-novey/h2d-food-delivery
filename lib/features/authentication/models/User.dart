import 'package:food_delivery_h2d/utils/constants/enums.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final bool status;
  final String role;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.status,
      required this.role,
      required this.phone,
      required this.createdAt,
      required this.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
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
      'password': password,
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
