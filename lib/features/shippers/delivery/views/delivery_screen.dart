import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/shippers/delivery/views/widgets/customer_tab.dart';
import 'package:food_delivery_h2d/features/shippers/delivery/views/widgets/restaurant_tab.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:get/get.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giao hàng'),
          centerTitle: true,
          backgroundColor: MyColors.darkPrimaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          bottom: const TabBar(
            dividerColor: Colors.white,
            indicatorColor: Colors.white, // Indicator color
            labelColor: Colors.white, // Active tab text color
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.white70, // Inactive tab text color
            tabs: [
              Tab(text: 'Nhà hàng'), // First tab
              Tab(text: 'Khách hàng'), // Second tab
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RestaurantTab(),
            CustomerTab(),
          ],
        ),
      ),
    );
  }
}
