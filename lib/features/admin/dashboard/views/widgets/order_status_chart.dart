import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:food_delivery_h2d/features/admin/dashboard/controllers/order_status_chart_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/controllers/statistic_controller.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';
import 'package:get/get.dart';

class OrderStatusChart extends StatelessWidget {
  const OrderStatusChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderStatusChartController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: MySizes.lg),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Biểu đồ hoàn thành và hủy đơn hàng',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MyColors.secondaryTextColor,
                      ),
                ),
              ),
              SizedBox(
                height: 300,
                width: 250,
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.incomeData.value == null) {
                    return const Center(
                      child: Text('Không có dữ liệu thu nhập.'),
                    );
                  }
                  final incomeData = controller.incomeData.value;
                  final completedOrders = incomeData?.completedOrders.toDouble() ?? 0;
                  final cancelledOrders = incomeData?.cancelledOrders.toDouble() ?? 0;
                  final total = completedOrders + cancelledOrders;
          
                  return PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 30,
                      sections: [
                        PieChartSectionData(
                          value: completedOrders,
                          title: MyFormatter.formatDouble(completedOrders),
                          color: Colors.green,
                          radius: controller.touchedIndex.value == 0 ? 105 : 75,
                          titleStyle: TextStyle(
                            fontSize: controller.touchedIndex.value == 0 ? 16 : 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PieChartSectionData(
                          value: cancelledOrders,
                          title: MyFormatter.formatDouble(cancelledOrders),
                          color: Colors.red,
                          radius: controller.touchedIndex.value == 1 ? 105 : 75,
                          titleStyle: TextStyle(
                            fontSize: controller.touchedIndex.value == 1 ? 16 : 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      borderData: FlBorderData(show: false),
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            controller.updateTouchedIndex(-1);
                            return;
                          }
                          controller.updateTouchedIndex(pieTouchResponse
                              .touchedSection!.touchedSectionIndex);
                        },
                      ),
                    ),
                    swapAnimationDuration: const Duration(milliseconds: 500),
                    swapAnimationCurve: Curves.easeInOut,
                  );
                }),
              ),
              Obx(() {
                final incomeData = controller.incomeData.value;
                final completedOrders = incomeData?.completedOrders.toDouble() ?? 0;
                final cancelledOrders = incomeData?.cancelledOrders.toDouble() ?? 0;
          
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: MySizes.md, left: MySizes.md, right: MySizes.md),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            margin: const EdgeInsets.only(right: MySizes.xs),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            'Hoàn thành',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            margin: const EdgeInsets.only(right: MySizes.xs),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            'Hủy',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
