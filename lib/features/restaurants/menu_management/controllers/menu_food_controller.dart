import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';

class MenuFoodController extends GetxController {
  static MenuFoodController get instance => Get.find();

  final RxList<Category> allCategories = <Category>[
    Category(categoryId: 2, restaurantId: 101, categoryName: 'Bún'),
    Category(categoryId: 3, restaurantId: 101, categoryName: 'Mì'),
    Category(categoryId: 1, restaurantId: 101, categoryName: 'Cơm'),
  ].obs; 

  final List<Item> allItems = [
    Item(itemId: 1, categoryId: 1, itemName: 'Cơm sườn', price: 50000, description: 'Cơm sườn ngon', isAvailable: true, itemImage: MyImagePaths.iconImage),
    Item(itemId: 2, categoryId: 1, itemName: 'Cơm tấm', price: 45000, description: 'Cơm tấm đặc biệt', isAvailable: false, itemImage: MyImagePaths.iconImage),
    Item(itemId: 3, categoryId: 2, itemName: 'Bún bò', price: 55000, description: 'Bún bò Huế', isAvailable: false, itemImage: MyImagePaths.imgBunBo),
    Item(itemId: 4, categoryId: 2, itemName: 'Bún bò', price: 55000, description: 'Bún bò Huế', isAvailable: true, itemImage: MyImagePaths.iconImage),
    Item(itemId: 5, categoryId: 2, itemName: 'Bún bò', price: 55000, description: 'Bún bò Huế', isAvailable: true, itemImage: MyImagePaths.iconImage),
    Item(itemId: 6, categoryId: 2, itemName: 'Bún bò', price: 55000, description: 'Bún bò Huế', isAvailable: false, itemImage: MyImagePaths.iconImage),
  ];

  void toggleItemAvailability(Item item) {
    item.isAvailable.value = !item.isAvailable.value;
  }

  List<Item> getItemsForCategory(int categoryId) {
    return allItems.where((item) => item.categoryId == categoryId).toList();
  }

  void reorderCategories(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;
    final category = allCategories.removeAt(oldIndex);
    allCategories.insert(newIndex, category);
  }
  
}
