import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/appbar.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/notification_icon.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quán ăn A",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.white),
          ),
          const SizedBox(height: MySizes.xs,),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: MySizes.xs),
                  height: 12,
                  width: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.openColor
                  )),
              Text(
                "Đang hoạt động",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: MyColors.openColor),
              ),
            ],
          ),          
        ],
      ),
      actions: [
        MyNotificationIcon(
          onPressed: () {
          },
        ),
      ],
    );
  }
}
