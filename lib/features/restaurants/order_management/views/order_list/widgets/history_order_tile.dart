import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';

import '../../../../../shippers/home/models/order_model.dart';

class HistoryOrderTile extends StatelessWidget {
  final Order order;

  const HistoryOrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MySizes.md,
        right: MySizes.sm,
        left: MySizes.sm,
      ),
      child: SizedBox(
        height: 165,
        child: Card(
          elevation: 4,
          shadowColor: MyColors.darkPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(MySizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyFormatter.formatDate(order.orderDatetime.toString()),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: MyColors.primaryTextColor),
                    ),
                    Text(
                      "Đã hủy",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: MyColors.primaryTextColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: MySizes.xs,
                ),
                const Divider(
                  color: MyColors.dividerColor,
                ),
                const SizedBox(
                  height: MySizes.xs,
                ),
                Text(
                  order.id.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                const SizedBox(
                  height: MySizes.xs,
                ),
                Row(
                  children: [
                    Text(
                      '10 món',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: MyColors.primaryTextColor),
                    ),
                  ],
                ),
                const Divider(
                  color: MyColors.dividerColor,
                ),
                const SizedBox(
                  height: MySizes.xs,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        'Lý do hủy',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: MyColors.primaryTextColor),
                      ),
                    ),
                    Text(
                      '20000đ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: MyColors.primaryTextColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
