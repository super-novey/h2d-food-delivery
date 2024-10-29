import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/images/image_text_image.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class ItemHome extends StatelessWidget {
  final String title;
  final String image;
  final Color textColor;
  final VoidCallback? onTap;

  const ItemHome({
    super.key,
    required this.title,
    required this.image,
    this.textColor = MyColors.darkPrimaryTextColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.dividerColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: MyVerticalImageText(
            padding: const EdgeInsets.all(MySizes.xs),
            image: image,
            title: title,
            width: 35,
            height: 35,
            widthImage: 30,
            heightImage: 30,
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: MyColors.darkPrimaryTextColor,
              fontWeight: FontWeight.bold
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
