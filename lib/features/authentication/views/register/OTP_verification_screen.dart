import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/appbar.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/otp_controller.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/customer_register_controller.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/widgets/login_header.dart';
import 'package:food_delivery_h2d/features/authentication/views/register/widgets/otp_countdown.dart';
import 'package:food_delivery_h2d/features/authentication/views/register/widgets/otp_widget.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key, this.emailAddress});
  final emailAddress;
  final OtpCountdown timer = OtpCountdown();
  final OtpController otpController = OtpController();
  // final List<TextEditingController> _controllers =
  //     List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    timer.init();
    timer.startTimer();

    // RegisterController.instance.sendOTP(emailAddress);

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryHeader(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: MySizes.iconMd,
              ),
            ),

            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),
            Text("Xác thực OTP",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .apply(color: Colors.white)),
          ],
        )),
        Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: "Mã OTP được gửi đến ",
                  children: [
                    TextSpan(
                      text: emailAddress.toString(),
                      style: const TextStyle(
                          color: MyColors.darkPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // OTP Form
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),
              Form(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                      (index) => OTPTextField(
                        controller: otpController.controllers[index],
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StreamBuilder(
                      initialData: "",
                      stream: timer.stream(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        String timer =
                            (snapshot.data == '') ? "00:00" : snapshot.data;
                        return Text(
                          timer,
                        );
                      }),
                  TextButton(
                      onPressed: () async {
                        await otpController.resendOTP(emailAddress);
                        timer.init();
                        timer.startTimer();
                      },
                      child: const Text("Gửi lại"))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    otpController.verifyOTP(emailAddress);
                  },
                  child: const Text("Xác thực"))
            ],
          ),
        )
      ],
    ));
  }
}