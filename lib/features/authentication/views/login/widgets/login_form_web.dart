import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/widgets/background_login.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/widgets/login_form.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class LoginFormWeb extends StatelessWidget {
  const LoginFormWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundLogin(),
        Positioned(
          top: (MediaQuery.of(context).size.height - 400) / 2,
          left: (MediaQuery.of(context).size.width - 800) / 2,
          child: Container(
            height: 400,
            width: 800,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
              color: Colors.white,
              // boxShadow: const [
              //   BoxShadow(
              //     color: MyColors.darkPrimaryColor, 
              //     //offset: Offset(0, 4),
              //     blurRadius: 8,
              //     spreadRadius: 0.5,
              //   ),
              // ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  height: 350,
                  child: const Padding(
                    padding: EdgeInsets.all(MySizes.xl),
                    child: LoginForm(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(MySizes.borderRadiusLg),
                      bottomRight: Radius.circular(MySizes.borderRadiusLg),
                    ),
                    child: Image.network(
                      'https://cdn.dribbble.com/users/1948370/screenshots/11100609/delivery_with_man31_4x.jpg',
                      width: 400,
                      height: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    
  }
}
