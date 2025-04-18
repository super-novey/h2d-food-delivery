import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_entity.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/currency.dart';

class ToppingTile extends StatelessWidget {
  const ToppingTile({super.key, required this.topping, this.onTap});

  final ToppingEntity topping;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // Thông tin
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Tên
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        style: textStyle.bodySmall!
                            .apply(color: MyColors.primaryTextColor),
                        topping.name ?? "",
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                        color: MyColors.secondaryTextColor,
                      )
                    ],
                  ),
                  // * Giá
                  Text(
                    style: textStyle.bodySmall!
                        .apply(color: MyColors.secondaryTextColor),
                    (topping.price ?? 0).formatCurrency,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: MySizes.sm,
            ),
            // Counter
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: topping.isActive ?? false, //TODO: gan value
                activeColor: MyColors.darkPrimaryColor,
                onChanged: (bool value) {
                  //TODO: cap nhat isActive
                },
              ),
            )
          ]),
          const Divider(
            thickness: 0.2,
            color: MyColors.dividerColor,
          )
        ],
      ),
    );
  }
}
