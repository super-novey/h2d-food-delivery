import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class WidgetSearchBar extends StatelessWidget {
  const WidgetSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: MySizes.sm),
      height: 45,
      child: TextField(
        controller: controller,
        // onChanged: (value) {
        //   controller.searchEmployee(query: value);
        // },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: MySizes.md),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear_rounded,
            ),
            onPressed: () {
              controller.clear();
            },
          ),
          hintText: "Nhập tên món ăn, nhà hàng",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MyColors.secondaryTextColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
            borderSide: const BorderSide(color: MyColors.darkPrimaryTextColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
            borderSide: const BorderSide(color: MyColors.darkPrimaryTextColor),
          ),
        ),
      ),
    );
  }
}
