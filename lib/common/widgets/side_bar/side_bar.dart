import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/images/circle_image.dart';
import 'package:food_delivery_h2d/common/widgets/side_bar/widgets/side_bar_item.dart';
import 'package:food_delivery_h2d/routes/routes.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
            color: MyColors.darkPrimaryColor,
            border: Border(
                right: BorderSide(color: MyColors.dividerColor, width: 1))),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: MySizes.spaceBtwItems),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(MySizes.borderRadiusMd),
                  child: const CircleImage(
                    imageUrl: MyImagePaths.iconLogo,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              const SizedBox(
                height: MySizes.spaceBtwInputFields,
              ),
              const Column(
                children: [
                  SideBarItem(
                    route: Routes.dashboard,
                    icon: Icons.home_outlined,
                    itemName: "Trang chủ",
                  ),
                  SideBarItem(
                    route: Routes.userManagerment,
                    icon: Icons.manage_accounts_outlined,
                    itemName: "Quản lý tài khoản",
                  ),
                  SideBarItem(
                    route: Routes.statistics,
                    icon: Icons.view_timeline_outlined,
                    itemName: "Thống kê",
                  ),
                  SideBarItem(
                    route: Routes.revenueReport,
                    icon: Icons.savings_outlined,
                    itemName: "Báo cáo doanh thu",
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
