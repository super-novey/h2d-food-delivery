import 'package:food_delivery_h2d/features/admin/dashboard/admin_dashboard.dart';
import 'package:food_delivery_h2d/features/admin/user_management/views/user_management.dart';
import 'package:food_delivery_h2d/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: Routes.dashboard, page: () => const AdminDashboard()),
    GetPage(name: Routes.userManagerment, page: () => const UserManagement())
  ];
}