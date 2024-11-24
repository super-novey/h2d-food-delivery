import 'package:food_delivery_h2d/data/address/address_repository.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  var provinces = [].obs;
  var districts = [].obs;
  var communes = [].obs;

  var selectedProvince = "".obs;
  var selectedDistrict = "".obs;
  var selectedCommune = "".obs;

  // Repository
  final _addressRepository = Get.put(AddressRepository());

  @override
  void onClose() {
    // TODO: implement onClose
    provinces.clear();
    districts.clear();
    communes.clear();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchProvinces() async {
  try {
    var provinceList = await _addressRepository.getProvinces();
    provinces.assignAll(provinceList);
    print("Dữ liệu các tỉnh: $provinces"); 
  } catch (e) {
    print(e);
  }
}

}
