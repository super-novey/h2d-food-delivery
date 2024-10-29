import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class ImageHeader extends StatelessWidget {
  final double height;
  const ImageHeader({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.secondaryTextColor,
      child: Image.network(
        'https://i.pinimg.com/originals/d9/b3/8e/d9b38e0220b181b597891c7ac30d46cb.jpg',
      width: double.infinity,
      height: height,
      fit: BoxFit.fill,),
    );
  }
}
