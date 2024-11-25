import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class ImageHeader extends StatelessWidget {
  final double height;
  final image;
  const ImageHeader({super.key, required this.height, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.secondaryTextColor,
      child: Image.network(
        image,
        width: double.infinity,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
