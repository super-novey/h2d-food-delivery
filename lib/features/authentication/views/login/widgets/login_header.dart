import 'package:flutter/material.dart';
import '../../../../../common/widgets/header/primary_header.dart';
import '../../../../../utils/constants/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyPrimaryHeaderContainer(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MySizes.defaultSpace, vertical: 100),
          child: Text(
            "Đăng nhập",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
