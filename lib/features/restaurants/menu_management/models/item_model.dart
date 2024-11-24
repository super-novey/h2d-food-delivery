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
  }) : isAvailable = (isAvailable ?? true).obs;

  Map<String, dynamic> toJson() {
    return {
      '_id': itemId,
      'categoryId': categoryId,
      'itemName': itemName,
      'price': price.toString(),
      'description': description,
      'status': isAvailable.value.toString(),
      'itemImage': itemImage,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json['_id'] ?? '',
      categoryId: json['categoryId'] ?? '',
      itemName: json['itemName'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      isAvailable: json['status'] ?? true,
      itemImage: json['itemImage'] ?? MyImagePaths.iconImage,
    );
  }
}
