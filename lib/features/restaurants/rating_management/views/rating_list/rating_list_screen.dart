import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food_delivery_h2d/features/restaurants/rating_management/controllers/rating_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/rating_management/views/rating_list/widgets/rating_tabbar.dart';
import 'package:food_delivery_h2d/features/restaurants/rating_management/views/rating_list/widgets/rating_tile.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class RatingListScreen extends StatelessWidget {
  const RatingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingController = Get.put(RatingController());

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text("Đánh giá"),
          showBackArrow: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: MySizes.sm),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Obx(() => Text(
                          ratingController.value.value.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(color: MyColors.primaryTextColor),
                        )),
                        const SizedBox(height: MySizes.xs,),
                    Obx(() => RatingStars(
                          axis: Axis.horizontal,
                          value: ratingController.value.value,
                          onValueChanged: (v) {
                            ratingController.value.value = v;
                          },
                          starCount: 5,
                          starSize: 20,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: true,
                          valueLabelVisibility: false,
                          animationDuration: const Duration(milliseconds: 1000),
                          starOffColor: MyColors.starOffColor,
                          starColor: MyColors.starColor,
                          angle: 12,
                        )),
                    const SizedBox(height: MySizes.spaceBtwItems / 2),
                    Obx(() => Text(
                          "${ratingController.count.value} đánh giá",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: MyColors.primaryTextColor),
                        )),
                    const SizedBox(height: MySizes.spaceBtwItems/2),
                    RatingTabbar(
                      onTap: (index) {
                        ratingController.updateFilter(index == 0 ? 0 : 6 - index);
                      },
                      tabs: const [
                        MyTab(value: 0, label: "Tất cả"),
                        MyTab(
                          value: 5,
                          label: "5",
                          icon: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        MyTab(
                            value: 4,
                            label: "4",
                            icon: Icon(
                              Icons.star,
                              color: Colors.amber,
                            )),
                        MyTab(
                            value: 3,
                            label: "3",
                            icon: Icon(
                              Icons.star,
                              color: Colors.amber,
                            )),
                        MyTab(
                            value: 2,
                            label: "2",
                            icon: Icon(
                              Icons.star,
                              color: Colors.amber,
                            )),
                        MyTab(
                            value: 1,
                            label: "1",
                            icon: Icon(
                              Icons.star,
                              color: Colors.amber,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  final ratings = ratingController.filteredRatings;
                  return ListView.builder(
                    itemCount: ratings.length,
                    itemBuilder: (context, index) {
                      return RatingTile(rating: ratings[index]);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}