import 'package:flutter/cupertino.dart'; // Import Cupertino widget
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food_delivery_h2d/features/restaurants/rating_management/controllers/rating_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/rating_management/views/rating_list/widget/rating_tile.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class RatingListScreen extends StatelessWidget {
  const RatingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingController = Get.put(RatingController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Đánh giá"),
        showBackArrow: false,
      ),
      body: Column(
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
                    
                Obx(() => RatingStars(
                      axis: Axis.horizontal,
                      value: ratingController.value.value,
                      onValueChanged: (v) {
                        ratingController.value.value = v;
                      },
                      starCount: 5,
                      starSize: 20,
                      // valueLabelColor: MyColors.darkPrimaryColor,
                      // valueLabelTextStyle: const TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w400,
                      //     fontStyle: FontStyle.normal,
                      //     fontSize: 12.0),
                      // valueLabelRadius: 10,
                      maxValue: 5,
                      starSpacing: 2,
                      maxValueVisibility: true,
                      valueLabelVisibility: false,
                      animationDuration: const Duration(milliseconds: 1000),
                      valueLabelPadding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 8),
                      valueLabelMargin: const EdgeInsets.only(right: 8),
                      starOffColor: MyColors.starOffColor,
                      starColor: MyColors.starColor,
                      angle: 12,
                    )),
                    const SizedBox(height: MySizes.spaceBtwItems/2,),
                Text(
                  "23 đánh giá",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: MyColors.primaryTextColor),
                ),
                 const SizedBox(height: MySizes.spaceBtwItems,),
                 Obx(() =>
                   SizedBox(
                        width: double.infinity,
                        child: CupertinoSegmentedControl<int>(
                          selectedColor: MyColors.darkPrimaryColor,
                          unselectedColor: Colors.white,
                          pressedColor: MyColors.lightPrimaryColor,
                          borderColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          children: const {
                            0: Text("Tất cả"),
                            5: Text("5 sao"),
                            4: Text("4 sao"),
                            3: Text("3 sao"),
                            2: Text("2 sao"),
                            1: Text("1 sao"),
                          },
                          onValueChanged: (int value) {
                            ratingController.updateFilter(value);
                          },
                          groupValue: ratingController.selectedFilter.value,
                        ),
                      ),
                 ),
                const SizedBox(height: 20),
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
    );
  }
}
