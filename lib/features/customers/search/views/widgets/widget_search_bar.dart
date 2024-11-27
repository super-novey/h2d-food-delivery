import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class WidgetSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const WidgetSearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: MySizes.sm),
      height: 45,
      child: TextField(
        controller: controller,
        focusNode: focusNode, 
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: MySizes.md),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: () {
              controller.clear();
              focusNode.requestFocus(); 
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
