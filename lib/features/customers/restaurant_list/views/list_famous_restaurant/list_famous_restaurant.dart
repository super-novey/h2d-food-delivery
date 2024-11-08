import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/restaurant_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/list_famous_restaurant/widgets/famous_restaurant_tile.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ListFamousRestaurant extends StatelessWidget {
  const ListFamousRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.put(RestaurantController());
    return SizedBox(
      height: 160,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.4,
              mainAxisSpacing: MySizes.xs),
          itemCount: restaurantController.restaurants.length,
          itemBuilder: (context, index) {
            final restaurant = restaurantController.restaurants[index];
            return FamousRestaurantTile(restaurant: restaurant);
          }),
    );
  }
}
