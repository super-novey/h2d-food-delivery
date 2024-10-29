import 'package:food_delivery_h2d/utils/constants/image_paths.dart';

class Restaurant {
  int restaurantId;
  String restaurantName;
  String image;
  double rating;

  Restaurant(
      {this.restaurantId = 0,
      this.restaurantName = '',
      this.image = MyImagePaths.iconImage,
      this.rating = 0.0});
}
