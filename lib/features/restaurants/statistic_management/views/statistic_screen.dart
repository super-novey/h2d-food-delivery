import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/controllers/statistic_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/views/widgets/restaurant_chart.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';
import 'package:get/get.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeController = Get.put(StatisticController());

    return Scaffold(
        appBar: const CustomAppBar(
          title: Text("Thống kê"),
        ),
        body: Obx(() {
          if (incomeController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (incomeController.incomeData.value == null) {
            return const Center(child: Text('Không có dữ liệu thu nhập.'));
          }

          return Padding(
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
                            const Icon(
                              Icons.savings_outlined,
                              color: MyColors.darkPrimaryTextColor,
                            ),
                            const SizedBox(
                              width: MySizes.xs,
                            ),
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
                          padding: const EdgeInsets.only(left: MySizes.xl - 2),
                          child: Text(
                            MyFormatter.formatCurrency(
                                incomeController.incomeData.value!.totalPrice),
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
                            const Icon(
                              Icons.inventory_outlined,
                              color: MyColors.darkPrimaryTextColor,
                            ),
                            const SizedBox(
                              width: MySizes.xs,
                            ),
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
                          padding: const EdgeInsets.only(left: MySizes.xl - 2),
                          child: Text(
                            "${incomeController.incomeData.value!.cancelledOrdersCount + incomeController.incomeData.value!.deliveredOrdersCount}",
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
                const SizedBox(height: MySizes.sm,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle_outlined,
                              color: MyColors.darkPrimaryTextColor,
                            ),
                            const SizedBox(
                              width: MySizes.xs,
                            ),
                            Text(
                              "Đơn hoàn thành",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(color: MyColors.darkPrimaryTextColor),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: MySizes.xl - 2),
                          child: Text(
                            incomeController.incomeData.value!.deliveredOrdersCount.toString(),
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
                            const Icon(
                              Icons.inventory_outlined,
                              color: MyColors.darkPrimaryTextColor,
                            ),
                            const SizedBox(
                              width: MySizes.xs,
                            ),
                            Text(
                              "Đơn từ chối",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(color: MyColors.darkPrimaryTextColor),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: MySizes.xl - 2),
                          child: Text(
                            incomeController.incomeData.value!.cancelledOrdersCount.toString(),
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
                const SizedBox(height: MySizes.spaceBtwItems,),
                SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: const RestaurantChart(),
                )
              ],
            ),
          );
        }));
  }
}
