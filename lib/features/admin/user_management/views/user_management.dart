import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/admin/web_layout.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return WebLayout(
      body: Center(
        child: Text('Dashboard Content Here'),
      ),
    );
  }
}
