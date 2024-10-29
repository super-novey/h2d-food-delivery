import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food_delivery_h2d/features/restaurants/rating_management/models/rating_restaurant_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';

class RatingTile extends StatelessWidget {
  final RatingRestaurant rating;

  const RatingTile({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MySizes.md,
        right: MySizes.sm,
        left: MySizes.sm,
      ),
      child: SizedBox(
        height: 155,
        child: Card(
          elevation: 4,
          shadowColor: MyColors.darkPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(MySizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(rating.avatar),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      width: MySizes.sm,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rating.nameCustomer,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: MyColors.darkPrimaryTextColor),
                        ),
                        RatingStars(
                          axis: Axis.horizontal,
                          value: rating.stars.toDouble(),
                          onValueChanged: (v) {},
                          starCount: 5,
                          starSize: 12,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: true,
                          valueLabelVisibility: false,
                          valueLabelPadding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: MyColors.starOffColor,
                          starColor: MyColors.starColor,
                          angle: 12,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: MySizes.sm,
                ),
                Text(
                  rating.comment,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: MyColors.primaryTextColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(
                  height: MySizes.sm,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyFormatter.formatDate(rating.orderDateTime.toString()),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: MyColors.primaryTextColor),
                    ),
                    Text(
                      MyFormatter.formatTime(rating.orderDateTime.toString()),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: MyColors.primaryTextColor),
                    )
                  ],
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     InkWell(
                //       onTap: () => {},
                //       child: Container(
                //         width: 80,
                //         height: 30,
                //         decoration: BoxDecoration(
                //           color: MyColors.darkPrimaryColor,
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         child: Center(
                //           child: Text("Đã xong",
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .labelSmall!
                //                   .apply(color: Colors.white)),
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
