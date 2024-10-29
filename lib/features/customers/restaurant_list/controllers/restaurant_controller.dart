import 'package:food_delivery_h2d/features/customers/restaurant_list/models/restaurant.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  var restaurants = <Restaurant>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  void fetchRestaurants() {
    restaurants.value = [
      Restaurant(
          restaurantId: 1,
          restaurantName: "Nhà Hàng Ngon",
          image: MyImagePaths.imgBunBo,
          rating: 4.5),
      Restaurant(
          restaurantId: 2,
          restaurantName: "Nhà Hàng 2",
          image: MyImagePaths.iconImage,
          rating: 4.0),
      Restaurant(
          restaurantId: 3,
          restaurantName: "Nhà Hàng 3",
          image: MyImagePaths.iconImage,
          rating: 5.0),
      Restaurant(
          restaurantId: 4,
          restaurantName: "Nhà Hàng 4",
          image: MyImagePaths.iconImage,
          rating: 4.8),
    ];
  }
}
