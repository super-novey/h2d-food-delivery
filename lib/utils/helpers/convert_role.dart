import 'package:food_delivery_h2d/features/authentication/views/register/customer_register_screen.dart';
import 'package:food_delivery_h2d/utils/constants/enums.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';

class ConvertEnumRole {
  static String toDisplayName(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return "Quản trị viên";
      case UserRole.partner:
        return "Đối tác";
      case UserRole.driver:
        return "Tài xế";
      case UserRole.customer:
        return "Khách hàng";
      default:
        return "Unknown";
    }
  }

  static String toImagePath(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return MyImagePaths.adminIcon;
      case UserRole.partner:
        return MyImagePaths.partnerIcon;
      case UserRole.driver:
        return MyImagePaths.driverIcon;
      case UserRole.customer:
        return MyImagePaths.customerIcon;
      default:
        return "Unknown";
    }
  }

  static void toPage(UserRole role) {
    switch (role) {
      case UserRole.admin:
      //TODO
      case UserRole.partner:
      case UserRole.driver:
      // TODO: Handle this case.
      case UserRole.customer:
        Get.to(() => CustomerRegisterScreen());
    }
  }
}
