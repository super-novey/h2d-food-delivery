import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Thống kê"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.md),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.savings_outlined, color: MyColors.darkPrimaryTextColor,),
                        SizedBox(width: MySizes.xs,),
                        Text(
                          "Tổng doanh thu",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: MySizes.xl-2),
                      child: Text(
                        "20000 VND",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: MyColors.primaryTextColor),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.inventory_outlined, color: MyColors.darkPrimaryTextColor,),
                        SizedBox(width: MySizes.xs,),
                        Text(
                          "Tổng đơn hàng",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: MySizes.xl-2),
                      child: Text(
                        "20",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: MyColors.primaryTextColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
     
          ],
        ),
      ),
    );
  }
}
