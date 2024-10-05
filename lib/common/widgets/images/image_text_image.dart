import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class MyVerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  const MyVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = MyColors.primaryTextColor,
    this.backgroundColor = Colors.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(MySizes.spaceBtwItems / 2),
        child: Column(
          children: [
            // circular icon
            Container(
              width: 50,
              height: 55,
              padding: const EdgeInsets.all(MySizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  width: 32,
                  height: 32,
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  // color: Colors.white,
                ),
              ),
            ),

            // Text
            const SizedBox(
              height: MySizes.spaceBtwItems / 4,
            ),
            Text(
              textAlign: TextAlign.center,
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: textColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
