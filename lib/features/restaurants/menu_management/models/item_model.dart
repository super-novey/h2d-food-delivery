import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';

class Item {
  String itemId;
  String categoryId;
  String partnerId;
  String itemName;
  int price;
  int quantity;
  String description;
  RxBool isAvailable;
  String itemImage;

  Item(
      {this.itemId = '',
      this.categoryId = '',
      this.partnerId = '',
      this.itemName = '',
      this.price = 0,
      this.description = '',
      bool? isAvailable,
      this.itemImage = MyImagePaths.iconImage,
      this.quantity = 0})
      : isAvailable = (isAvailable ?? true).obs;

  Map<String, dynamic> toJson() {
    return {
      '_id': itemId,
      'categoryId': categoryId,
      'itemName': itemName,
      'price': price.toString(),
      'description': description,
      'status': isAvailable.value.toString(),
      'itemImage': itemImage,
      'partnerId': partnerId,
      "quantity": quantity.toString()
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json['_id'] ?? '',
      categoryId: json['categoryId'] ?? '',
      partnerId: json['partnerId'] ?? '',
      itemName: json['itemName'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      isAvailable: json['status'] ?? true,
      itemImage: json['itemImage'] ?? MyImagePaths.iconImage,
      quantity: json['quantity'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Item('
        'itemId: $itemId, '
        'categoryId: $categoryId, '
        'partnerId: $partnerId, '
        'itemName: $itemName, '
        'price: $price, '
        'quantity: $quantity, '
        'description: $description, '
        'isAvailable: ${isAvailable.value}, '
        'itemImage: $itemImage'
        ')';
  }
}
