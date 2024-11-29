import 'package:food_delivery_h2d/bindings/network_manager.dart';
import 'package:food_delivery_h2d/data/category/category_repository.dart';
import 'package:food_delivery_h2d/data/item/item_repository.dart';
import 'package:food_delivery_h2d/data/partner/partner_repository.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/models/detail_partner_model.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/models/restaurant.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';

class RestaurantController extends GetxController {
  static RestaurantController get instance => Get.find();

  List<Item> allItems = <Item>[].obs;
  var errorMessagePartner = ''.obs;

  var isLoading = false.obs;
  List<Category> allCategories = <Category>[].obs;
  var restaurants = <Restaurant>[].obs;
  var detailPartner = Rxn<DetailPartnerModel>();

  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());
  final ItemRepository _itemRepository = Get.put(ItemRepository());
  final PartnerRepository _repository = Get.put(PartnerRepository());
  String userId = '';

  void setUserId(String id) {
    userId = id;
  }

  @override
  void onInit() async {
    super.onInit();
    if (userId.isNotEmpty) {
      await fetchCategoriesAndItems();
    }

  }

  Future<void> fetchCategoriesAndItems() async {
    try {
      isLoading.value = true;
      allCategories.assignAll(
          await _categoryRepository.getCategoriesInRestaurant(userId));
      await fetchAllItems();
    } catch (e) {
      print("Lỗi khi lấy danh mục và món ăn: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAllItems() async {
    try {
      final allItemsByCategory = await Future.wait(
        allCategories
            .map((cat) => _itemRepository.getItemsByCategoryIDInCustomer(cat.categoryId)),
      );
      final combinedItems =
          allItemsByCategory.expand((items) => items).toList();
      allItems.assignAll(combinedItems);
    } catch (error) {
      print("Lỗi khi lấy món ăn: $error");
    }
  }

  List<Item> getItemsForCategory(String categoryId) {
    return allItems.where((item) => item.categoryId == categoryId).toList();
  }

  void fetchDetailPartner(String partnerId) async {
    try {
      isLoading(true);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        errorMessagePartner.value = "No internet connection";
        return;
      }

      final partnerResponse =
          await _repository.getPartnerByPartnerId(partnerId);
      detailPartner.value = partnerResponse;
      print(
          "Controller received partnerResponse: ${partnerResponse.toString()}");
    } catch (e) {
      print("Error: ${e.toString()}");

      errorMessagePartner.value =
          "Error fetching partner details: ${e.toString()}";
    } finally {
      isLoading(false);
    }
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
