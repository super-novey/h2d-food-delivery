import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/models/restaurant.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class FamousRestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const FamousRestaurantTile({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MySizes.sm),
      child: Card(
        elevation: 2,
        shadowColor: MyColors.darkPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: MySizes.md),
          child: Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(MySizes.borderRadiusMd),
                  child: Image.asset(
                    restaurant.image,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: MySizes.sm,
                ),
                SizedBox(
                  width: 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      restaurant.restaurantName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: MyColors.darkPrimaryTextColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: MySizes.xs,
                ),
                RatingStars(
                  axis: Axis.horizontal,
                  value: restaurant.rating.toDouble(),
                  onValueChanged: (v) {},
                  starCount: 5,
                  starSize: 12,
                  maxValue: 5,
                  starSpacing: 2,
                  maxValueVisibility: true,
                  valueLabelVisibility: false,
                  valueLabelPadding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                  valueLabelMargin: const EdgeInsets.only(right: 8),
                  starOffColor: MyColors.starOffColor,
                  starColor: MyColors.starColor,
                  angle: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
