import 'package:food_delivery_h2d/data/address/address_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/authentication/models/CommuneModel.dart';
import 'package:food_delivery_h2d/features/authentication/models/DistrictModel.dart';
import 'package:food_delivery_h2d/features/authentication/models/ProvinceModel.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/models/profile_restaurant_model.dart';

class ProfileRestaurantController extends GetxController {
  static ProfileRestaurantController get instance => Get.find();
  final _addressRepository = Get.put(AddressRepository());

  // Thêm thuộc tính profile
  var profile = ProfileRestaurant(); // Khởi tạo ProfileRestaurant theo nhu cầu

  void toggleItemAvailability(ProfileRestaurant profile) {
    profile.isAvailable.value =
        !profile.isAvailable.value; // Chuyển đổi trạng thái
  }

  var isLoading = false.obs;
  late String provinceName;
  late String districtName;
  late String communeName;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  String get address {
    return "${LoginController.instance.currentUser.detailAddress}, $communeName, $districtName, $provinceName";
  }

  Future fetchData() async {
    try {
      isLoading.value = true;
      await _fetchProvinceName();
      await _fetchDistrictName();
      await _fetchCommunes();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _fetchProvinceName() async {
    try {
      final provinces = await _addressRepository.getProvinces();
      provinceName = provinces
          .firstWhere((province) =>
              province.id == LoginController.instance.currentUser.provinceId)
          .fullName;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchDistrictName() async {
    try {
      final districts = await _addressRepository
          .getDistrict(LoginController.instance.currentUser.provinceId);
      districtName = districts
          .firstWhere((district) =>
              district.id == LoginController.instance.currentUser.districtId)
          .fullName;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchCommunes() async {
    try {
      final communes = await _addressRepository
          .getCommunes(LoginController.instance.currentUser.districtId);

      communeName = communes
          .firstWhere((commune) =>
              commune.id == LoginController.instance.currentUser.communeId)
          .fullName;
    } catch (e) {
      print(e);
    }
  }
}
