import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_h2d/data/item/item_repository.dart';
import 'package:food_delivery_h2d/data/response/status.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/controllers/menu_food_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/helpers/convert_text.dart';
import 'package:food_delivery_h2d/utils/helpers/multiple_part_file.dart';
import 'package:food_delivery_h2d/utils/popups/full_screen_loader.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

class UpdateMenuFoodController extends GetxController {
  static UpdateMenuFoodController get instance => Get.find();
  var isEditting = false.obs;
  var isAdd = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var foodImage = Rx<File?>(null);
  var selectedCaterory = Rxn<String>();

  GlobalKey<FormState> itemFormKey = GlobalKey<FormState>();

  // Repository
  final _itemRepository = Get.put(ItemRepository());

  void toggleEditting() {
    isEditting.value = !isEditting.value;
    if (!isEditting.value) {
      isAdd.value = false;
    }
  }

  Future save() async {
    if (!itemFormKey.currentState!.validate()) {
      return;
    }
    if (selectedCaterory.value == null) {
      Loaders.errorSnackBar(
          title: "Lỗi", message: "Món ăn chưa thuộc danh mục nào!");
      return;
    }

    final newItem = getItemFromForm();

    if (isAdd.value) {
      _handleAddItem(newItem);
    } else {}
  }

  Future _handleAddItem(Item newItem) async {
    try {
      FullScreenLoader.openDialog("Đang xử lý", MyImagePaths.spoonAnimation);
      List<http.MultipartFile> files = [];

      var fields = [
        {'fieldName': 'itemImage', 'file': foodImage.value},
      ];
      files = await MultiplePartFileHelper.createMultipleFiles(fields);
      final res = await _itemRepository.addItem(newItem, files);

      await Future.delayed(const Duration(milliseconds: 300));

      if (res.status == Status.ERROR) {
        Loaders.errorSnackBar(title: "Lỗi", message: res.message);
        return;
      }

      MenuFoodController.instance.allItems.add(res.data!);

      print(MenuFoodController.instance.allItems.length);

      Loaders.successSnackBar(title: "Thành công", message: res.message);
    } catch (e) {
      Loaders.errorSnackBar(title: "Lỗi", message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }

  Future pickImage(Rx<File?> imageFile) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile.value = File(pickedImage.path);
    } else {
      print("No image");
    }
  }

  Item getItemFromForm() {
    return Item(
        itemName: nameController.text,
        itemId: "",
        categoryId: selectedCaterory.value.toString(),
        itemImage: nameController.text,
        price: ConvertText.getTextAsInteger(priceController.text),
        description: descriptionController.text,
        isAvailable: true,
        partnerId: LoginController.instance.currentUser.partnerId);
  }
}
