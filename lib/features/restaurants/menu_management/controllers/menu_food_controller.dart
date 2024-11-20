import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_h2d/data/category/category_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';

class MenuFoodController extends GetxController {
  static MenuFoodController get instance => Get.find();

  final List<Item> allItems = [
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

  var isLoading = false.obs;
  List<Category> allCategories = <Category>[].obs;

  final _newCategoryController = TextEditingController();

  // Repository
  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());

  @override
  void onClose() {
    // TODO: implement onClose
    _newCategoryController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      allCategories.clear();
      allCategories.assignAll(
          await _categoryRepository.getCategoriesInRestaurant(
              LoginController.instance.currentUser.partnerId));
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> addCategory() async {
  //   try {
  //     isLoading.value = true;
  //     // final newCategory = await _categoryRepository.addCategory(Category(
  //     //     categoryName: "Duy100", restaurantId: "6734bf1020d35f486f7f320b"));
  //     final newCategory = Category(
  //         categoryName: "D10", restaurantId: "6734bf1020d35f486f7f320b");
  //     allCategories.add(newCategory);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void removeCategory(String categoryId) async {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(MySizes.md),
        title: "Xóa danh mục",
        middleText: "Bạn có chắc chắn muốn xóa danh mục này!",
        confirm: ElevatedButton(
            onPressed: () async {
              try {
                await _categoryRepository.removeCategory(categoryId);
                allCategories
                    .removeWhere((item) => item.categoryId == categoryId);
                Navigator.of(Get.overlayContext!).pop();
                Loaders.successSnackBar(
                    title: "Thành công!", message: "Xóa danh mục");
              } catch (err) {
                Loaders.successSnackBar(
                    title: "Thất bại!", message: "Xóa danh mục");
              }
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Text("Xóa")),
        cancel: OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: MySizes.md, vertical: 0)),
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("Quay lại")));
  }

  void toggleItemAvailability(Item item) {
    item.isAvailable.value = !item.isAvailable.value;
  }

  List<Item> getItemsForCategory(String categoryId) {
    return allItems.where((item) => item.categoryId == categoryId).toList();
  }

  void reorderCategories(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;
    final category = allCategories.removeAt(oldIndex);
    allCategories.insert(newIndex, category);

    allCategories.map((item) => print(item.categoryId));
  }

  void addEmptyCategory() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MySizes.md),
      title: "Thêm danh mục",
      confirm: ElevatedButton(
        onPressed: () async {
          try {
            String categoryName = _newCategoryController.text.trim();
            if (categoryName.isEmpty) {
              Loaders.successSnackBar(
                title: "Thất bại!",
                message: "Tên danh mục không thể trống",
              );
              return;
            }

            final newCategory = await _categoryRepository.addCategory(Category(
                categoryName: categoryName,
                restaurantId: LoginController.instance.currentUser.partnerId));

            allCategories.add(newCategory);

            Navigator.of(Get.overlayContext!).pop();
            Loaders.successSnackBar(
              title: "Thành công!",
              message: "Thêm danh mục thành công",
            );
          } catch (err) {
            Loaders.successSnackBar(
              title: "Thất bại!",
              message: "${err}",
            );
          }
        },
        child: const Text("Thêm"),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Quay lại"),
      ),
      content: Column(
        children: [
          TextField(
            controller: _newCategoryController,
            decoration: const InputDecoration(
              labelText: "Tên danh mục",
              hintText: "Nhập tên danh mục",
            ),
          ),
        ],
      ),
    );
  }

  void remove(int index) {
    allCategories.removeAt(index);
  }

  Future save() async {
    for (var cat in allCategories) {
      final index =
          allCategories.indexWhere((item) => item.categoryId == cat.categoryId);
      final updatedCategory = await _categoryRepository.updateCategory(cat);
      if (index != -1) {
        // Update the category's name
        allCategories[index] = updatedCategory;
        print("Category updated successfully!");
      } else {
        print("Category with ID ${updatedCategory.categoryId} not found!");
      }
    }
  }
}
