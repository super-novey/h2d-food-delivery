import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/appbar.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/customers/home/controllers/home_controller.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CustomerAppbar extends StatelessWidget {
  const CustomerAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(LoginController());
    final homeController = Get.put(HomeController());

    final addressKey = RxInt(0);

    return MyAppBar(
      padding: const EdgeInsets.only(left: MySizes.xs),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: MySizes.lg - 2),
            child: Text(
              "Giao đến:",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: Colors.white),
            ),
          ),
          const SizedBox(height: MySizes.xs),
          InkWell(
            onTap: () async {
              await authController.getCurrentLocation();
              addressKey.value++;
            },
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: MySizes.iconMs,
                ),
                const SizedBox(width: MySizes.xs),
                Obx(() => SizedBox(
                      width: 280,
                      child: FutureBuilder<String?>(
                        key: ValueKey(addressKey.value),
                        future: authController.currentLocation != null
                            ? homeController.getAddressFromCoordinates(
                                authController.currentLocation!['latitude'],
                                authController.currentLocation!['longitude'],
                              )
                            : Future.value(null),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.connectionState == ConnectionState.waiting
                                ? "Đang lấy địa chỉ hiện tại..."
                                : snapshot.hasData && snapshot.data != null
                                    ? snapshot.data!
                                    : "Chọn địa chỉ",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white),
                          );
                        },
                      ),
                    )),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: MySizes.iconXs,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
