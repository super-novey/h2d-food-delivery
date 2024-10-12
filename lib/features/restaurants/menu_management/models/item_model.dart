import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';
class Item {
  int itemId;
  int categoryId;
  String itemName;
  int price;
  String description;
  RxBool isAvailable;
  String itemImage;

  Item({
    this.itemId = 0,
    this.categoryId = 0,
    this.itemName = '',
    this.price = 0,
    this.description = '',
    bool? isAvailable,
    this.itemImage = MyImagePaths.iconImage,
  }): isAvailable = (isAvailable ?? true).obs;
}
