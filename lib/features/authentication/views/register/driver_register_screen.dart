import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/appbar.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class DriverRegisterScreen extends StatelessWidget {
  const DriverRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        iconColor: MyColors.darkPrimaryColor,
      ),
    );
  }
}
