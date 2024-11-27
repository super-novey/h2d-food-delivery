import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/restaurant_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/models/detail_partner_model.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/widgets/menu_restaurant_tile.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class DetailRestaurantScreen extends StatelessWidget {
  final String userId;

  const DetailRestaurantScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.put(RestaurantController());

    // Nhận dữ liệu từ Get.arguments
    final partner = Get.arguments as DetailPartnerModel?; // Partner là kiểu dữ liệu trả về

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Chi tiết nhà hàng'),
      ),
      body: Column(
        children: [
          Column(
              children: [
                Text(
                    partner?.userId.name ?? "",
                    style: const TextStyle(
                      color: MyColors.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                // Hiển thị các thông tin chi tiết từ partner
              ],
            )
        ],
      ),
    );
  }
}
