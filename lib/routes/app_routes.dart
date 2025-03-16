import 'package:food_delivery_h2d/features/admin/approval_user/views/approval_user_list/approval_user_list.dart';
import 'package:food_delivery_h2d/features/admin/dashboard/views/admin_dashboard.dart';
import 'package:food_delivery_h2d/features/admin/user_management/views/list_user/user_management.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/login_screen.dart';
import 'package:food_delivery_h2d/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: Routes.dashboard, page: () => const AdminDashboard(), transition: Transition.noTransition),
    GetPage(name: Routes.userManagerment, page: () => const UserManagementScreen(), transition: Transition.noTransition),
    GetPage(name: Routes.approveRequest, page: () => const ApprovalUserList(), transition: Transition.noTransition),
    GetPage(name: Routes.logout, page: () => const LoginScreen(), transition: Transition.noTransition)
  ];
}