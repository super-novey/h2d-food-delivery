import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/admin/user_management/models/user_model.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/controllers/profile_restaurant_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/views/profile_restaurant_detail/profile_restaurant_detail_screen.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/views/widgets/profile_header.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/enums.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/helpers/convert_role.dart';
import 'package:get/get.dart';

class DetailApprovalUser extends StatelessWidget {
  final UserModel userSelected;
  const DetailApprovalUser({super.key, required this.userSelected});

  @override
  Widget build(BuildContext context) {
    final profileRestaurantController = Get.put(ProfileRestaurantController());
    String roleText = ConvertEnumRole.toDisplayName(
                          UserRole.values.firstWhere(
                              (e) => e.toString() == 'UserRole.${userSelected.role}'));
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(MySizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Họ tên",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: MyColors.darkPrimaryTextColor),
                      ),
                      Text(
                        userSelected.name,
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
                        "Email",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: MyColors.darkPrimaryTextColor),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          userSelected.email,
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
                          userSelected.id,
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
                        "Vai trò",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: MyColors.darkPrimaryTextColor),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          roleText,
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Biển số xe",
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .bodySmall!
                  //           .apply(color: MyColors.darkPrimaryTextColor),
                  //     ),
                  //     SizedBox(
                  //       width: 200,
                  //       child: Text(
                  //         "quanan@gmail.com",
                  //         textAlign: TextAlign.right,
                  //         overflow: TextOverflow.ellipsis,
                  //         style:
                  //             Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //                   color: MyColors.primaryTextColor,
                  //                   height: 2,
                  //                 ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  
                ],
              ),
            ),
          ],
        );
  }
}