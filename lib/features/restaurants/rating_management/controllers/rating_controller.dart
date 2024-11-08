import 'package:food_delivery_h2d/features/restaurants/rating_management/models/rating_restaurant_model.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
    static RatingController get instance => Get.find();
  var selectedFilter = 0.obs;
  var value = 0.0.obs;
  var count = 0.obs;
  // Danh sách bình luận mẫu
  final List<RatingRestaurant> ratings = [
    RatingRestaurant(
        comment: 'Rất ngon!',
        stars: 5,
        orderDateTime: DateTime.now(),
        nameCustomer: 'Nguyễn Văn A',
        avatar: MyImagePaths.iconMenu),
    RatingRestaurant(
        comment: 'Tôi không thích món này.',
        stars: 2,
        orderDateTime: DateTime.now().subtract(const Duration(days: 1)),
        nameCustomer: 'Trần Thị B',
        avatar: MyImagePaths.iconImage),
    RatingRestaurant(
        comment: 'Bình thường.',
        stars: 3,
        orderDateTime: DateTime.now().subtract(const Duration(days: 3)),
        nameCustomer: 'Phạm Thị D',
        avatar: MyImagePaths.iconImage),
    RatingRestaurant(
        comment: 'Khá ổn.',
        stars: 4,
        orderDateTime: DateTime.now().subtract(const Duration(days: 4)),
        nameCustomer: 'Nguyễn Văn E',
        avatar: MyImagePaths.iconImage),
    RatingRestaurant(
        comment: 'Tôi sẽ không quay lại.',
        stars: 1,
        orderDateTime: DateTime.now().subtract(const Duration(days: 5)),
        nameCustomer: 'Đỗ Văn F',
        avatar: MyImagePaths.iconImage),
  ];

  @override
  void onInit() {
    super.onInit();
    calculateAverageRating(); 
    countComments();
  }
  void calculateAverageRating() {
    if (ratings.isNotEmpty) {
      double totalStars = ratings.fold(0, (sum, rating) => sum + rating.stars);
      value.value = totalStars / ratings.length; 
    } else {
      value.value = 0.0;
    }
  }

  void countComments() {
    count.value = ratings.length;
  }
  


  List<RatingRestaurant> get filteredRatings {
  if (selectedFilter.value == 0) {  
    return ratings;
  }
  return ratings.where((rating) => rating.stars == selectedFilter.value).toList();
}


  void updateFilter(int newFilter) {
  selectedFilter.value = newFilter;
  print("Updated selectedFilter: ${selectedFilter.value}"); // Log giá trị mới
  print("Filtered ratings count: ${filteredRatings.length}"); // Log số lượng đánh giá đã lọc
}



}
