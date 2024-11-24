import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/common/widgets/text_field/my_text_filed.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/controllers/menu_food_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/controllers/update_menu_food_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class MenuFoodDetailScreen extends StatelessWidget {
  MenuFoodDetailScreen({super.key, required this.selectedItem});
  final Item selectedItem;
  final menuFoodController = Get.put(MenuFoodController());
  final updateMenuFoodController = Get.put(UpdateMenuFoodController());

  void fetchFoodDetail() {
    updateMenuFoodController.nameController.text = selectedItem.itemName;
    updateMenuFoodController.priceController.text =
        selectedItem.price.toString();
    updateMenuFoodController.descriptionController.text =
        selectedItem.description;

    String categoryId = selectedItem.categoryId.toString();
    if (menuFoodController.allCategories
        .any((category) => category.categoryId.toString() == categoryId)) {
      updateMenuFoodController.selectedCaterory.value = categoryId;
    } else {
      updateMenuFoodController.selectedCaterory.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchFoodDetail();
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(updateMenuFoodController.isEditting.value
            ? "Chỉnh sửa món ăn"
            : "Thêm món ăn"),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.save,
                size: MySizes.iconMd,
              ),
              onPressed: () {
                updateMenuFoodController.save();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: MySizes.md, right: MySizes.md, left: MySizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hình ảnh",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: MyColors.darkPrimaryTextColor),
                      ),
                      const SizedBox(
                        height: MySizes.sm,
                      ),
                      Text(
                        "Món có hình ảnh sẽ dễ\nthu hút khách hàng hơn",
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: MyColors.secondaryTextColor,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () => updateMenuFoodController
                              .pickImage(updateMenuFoodController.foodImage),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(MySizes.borderRadiusMd),
                              child: updateMenuFoodController.foodImage.value !=
                                      null
                                  ? Image.file(
                                      updateMenuFoodController.foodImage.value!,
                                      fit: BoxFit.cover,
                                      width: 70,
                                      height: 70,
                                    )
                                  : Image.asset(selectedItem.itemImage,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover)),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sửa ảnh",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: MyColors.darkPrimaryTextColor,
                                    fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(MySizes.sm),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: MySizes.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tên",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        SizedBox(
                          width: 280,
                          child: MyTextFiled(
                              textController:
                                  updateMenuFoodController.nameController,
                              label: "Nhập tên món ăn"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: MySizes.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Giá",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        SizedBox(
                          width: 280,
                          child: MyTextFiled(
                              textController:
                                  updateMenuFoodController.priceController,
                              label: "Nhập giá món ăn (VNĐ)"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: MySizes.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Danh mục",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        SizedBox(
                          width: 150,
                          height: 55,
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<String?>(
                                value: updateMenuFoodController
                                    .selectedCaterory.value,
                                dropdownColor: MyColors.iconColor,
                                onChanged: (String? newValue) {
                                  updateMenuFoodController
                                      .selectedCaterory.value = newValue ?? '';
                                },
                                isExpanded: true,
                                hint: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(MySizes.sm + 2),
                                    child: Text(
                                      "Chọn danh mục",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: MyColors.secondaryTextColor,
                                          ),
                                    ),
                                  ),
                                ),
                                selectedItemBuilder: (BuildContext context) {
                                  return menuFoodController.allCategories
                                      .map((Category category) {
                                    return Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            MySizes.sm + 2),
                                        child: Text(
                                          category.categoryName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .apply(
                                                  color: MyColors
                                                      .primaryTextColor),
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                                items: menuFoodController.allCategories
                                    .map((Category category) {
                                  return DropdownMenuItem<String?>(
                                    value: category.categoryId.toString(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(MySizes.sm + 2),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          category.categoryName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .apply(
                                                  color: MyColors
                                                      .primaryTextColor),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwItems,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: MySizes.sm),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mô tả",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: MyColors.darkPrimaryTextColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwItems,
                  ),
                  MyTextFiled(
                    textAlign: TextAlign.left,
                    textController:
                        updateMenuFoodController.descriptionController,
                    label: "Nhập mô tả món ăn",
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
