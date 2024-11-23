import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/admin/dashboard/views/widgets/pie_chart.dart';
import 'package:food_delivery_h2d/features/admin/web_layout.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebLayout(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 500,
          child: UserRoleChart(),
        ),
      )
    );
  }
}
