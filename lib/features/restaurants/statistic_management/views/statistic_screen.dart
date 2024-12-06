import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/controllers/statistic_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/views/widgets/choose_date_widget.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/views/widgets/restaurant_chart.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/views/widgets/statistic_widget.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ChooseDateWidget(),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),
              const Padding(
                padding: EdgeInsets.all(MySizes.md),
                child: StatisticWidget(),
              ),
   
              Obx(() {
                if (incomeController.errorMessage.isNotEmpty) {
                  return const Center(
                    child: Text(
                      "",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return SizedBox(
                  height: 430,
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(MySizes.md),
                    child: RestaurantChart(),
                  ),
                );
              })
            ],
          ),
        ));
  }
}
