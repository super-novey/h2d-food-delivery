import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/widgets/login_form.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/widgets/login_form_web.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (kIsWeb) 
              LoginFormWeb()
            else ...[
              LoginHeader(),
              Padding(
                padding: EdgeInsets.all(MySizes.defaultSpace),
                child: Column(
                  children: [LoginForm()],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
