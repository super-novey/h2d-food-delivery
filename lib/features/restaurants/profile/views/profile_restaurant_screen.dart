import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/controllers/profile_restaurant_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/views/profile_restaurant_detail/profile_restaurant_detail_screen.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/views/widgets/profile_header.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ProfileRestaurantScreen extends StatelessWidget {
  const ProfileRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileRestaurantController = Get.put(ProfileRestaurantController());
    return Scaffold(
        appBar: const CustomAppBar(
          title: Text("Hồ sơ của tôi"),
          showBackArrow: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.all(MySizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trạng thái hoạt động",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        Obx(() => Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                value: profileRestaurantController
                                    .profile.isAvailable.value,
                                activeColor: MyColors.darkPrimaryColor,
                                onChanged: (bool value) {
                                  profileRestaurantController
                                      .toggleItemAvailability(
                                          profileRestaurantController.profile);
                                },
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ngày tham gia",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        Text(
                          "12/12/2024",
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: MyColors.primaryTextColor,
                                    height: 2,
                                  ),
                        )
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tên quán ăn",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            "Quán ăn nhanh",
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: MyColors.primaryTextColor,
                                      height: 2,
                                    ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Số điện thoại",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            "019219292929",
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: MyColors.primaryTextColor,
                                      height: 2,
                                    ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            "quanan@gmail.com",
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: MyColors.primaryTextColor,
                                      height: 2,
                                    ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems),
                    Text(
                      "Địa chỉ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: MyColors.darkPrimaryTextColor),
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems),
                    Text(
                      "33, Võ Văn Ngân, phường Linh Chiểu, TP Thủ Đức, TP HCM",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyColors.primaryTextColor,
                            height: 2,
                          ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems),
                    Text(
                      "Mô tả",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: MyColors.darkPrimaryTextColor),
                    ),
                    const SizedBox(height: MySizes.spaceBtwItems),
                    Text(
                      "Quán ăn ngon",
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyColors.primaryTextColor,
                            height: 2,
                          ),
                    ),
                    const SizedBox(
                      height: MySizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(ProfileRestaurantDetailScreen());
                        },
                        child: const Text("Chỉnh sửa thông tin"),
                      ),
                    ),
                    const SizedBox(
                      height: MySizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Đăng xuất"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
