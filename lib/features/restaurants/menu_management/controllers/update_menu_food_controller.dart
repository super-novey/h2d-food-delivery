import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateMenuFoodController extends GetxController {
  static UpdateMenuFoodController get instance => Get.find();
  var isEditting = false.obs;
  var isAdd = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var selectedCaterory = Rxn<String>();
  void toggleEditting() {
    isEditting.value = !isEditting.value;
    if (!isEditting.value) {
      isAdd.value = false;
    }
  }
}
