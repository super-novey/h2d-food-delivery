import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/header/wave_header.dart';
import 'package:food_delivery_h2d/common/widgets/images/circle_image.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/devices/devices_utils.dart';
import '../../../../../common/widgets/header/primary_header.dart';
import '../../../../../utils/constants/sizes.dart';

class LoginHeader extends StatelessWidget {
  final Widget child;
  const LoginHeader({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return WaveHeader(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(
                left: MySizes.defaultSpace,
                right: MySizes.defaultSpace,
                top: MyDeviceUtils.getAppBarHeight(),
                bottom: 100),
            child: child),
      ),
    );
  }
}
