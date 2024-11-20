import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';
class Item {
  String itemId;
  String categoryId;
  String itemName;
  int price;
  String description;
  RxBool isAvailable;
  String itemImage;

  Item({
    this.itemId = '',
    this.categoryId = '',
    this.itemName = '',
    this.price = 0,
    this.description = '',
    bool? isAvailable,
    this.itemImage = MyImagePaths.iconImage,
  }): isAvailable = (isAvailable ?? true).obs;
}