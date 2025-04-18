import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_group_entity.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class ToppingGroupItem extends StatelessWidget {
  const ToppingGroupItem({super.key, required this.toppingGroup, this.onTap});

  final ToppingGroupEntity toppingGroup;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shadowColor: MyColors.darkPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // Thông tin
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: textStyle.bodySmall!
                        .apply(color: MyColors.primaryTextColor),
                    toppingGroup.name,
                  ),
                  Text(
                    style: textStyle.bodySmall!
                        .apply(color: MyColors.secondaryTextColor),
                    toppingGroup.toppingNames,
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
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    style: textStyle.bodySmall!
                        .apply(color: MyColors.secondaryTextColor),
                    toppingGroup.toppingCounter),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                  color: MyColors.secondaryTextColor,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
