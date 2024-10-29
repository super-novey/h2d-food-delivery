import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  var items = <Item>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() {
    items.value = [
      Item(
          itemId: 1,
          categoryId: 1,
          itemName: 'Cơm sườn',
          price: 50000,
          description: 'Cơm sườn ngon',
          isAvailable: true,
          itemImage: MyImagePaths.iconImage),
      Item(
          itemId: 2,
          categoryId: 1,
          itemName: 'Cơm tấm',
          price: 45000,
          description: 'Cơm tấm đặc biệt',
          isAvailable: false,
          itemImage: MyImagePaths.iconImage),
      Item(
          itemId: 3,
          categoryId: 2,
          itemName: 'Bún bò',
          price: 55000,
          description: 'Bún bò Huế',
          isAvailable: false,
          itemImage: MyImagePaths.imgBunBo),
      Item(
          itemId: 4,
          categoryId: 2,
          itemName: 'Bún bò',
          price: 55000,
          description: 'Bún bò Huế',
          isAvailable: true,
          itemImage: MyImagePaths.iconImage),
      Item(
          itemId: 5,
          categoryId: 2,
          itemName: 'Bún bò',
          price: 55000,
          description: 'Bún bò Huế',
          isAvailable: true,
          itemImage: MyImagePaths.iconImage),
      Item(
          itemId: 6,
          categoryId: 2,
          itemName: 'Bún bò',
          price: 55000,
          description: 'Bún bò Huế',
          isAvailable: false,
          itemImage: MyImagePaths.iconImage),
    ];
  }
}
