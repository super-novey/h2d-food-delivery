import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Loaders.successSnackBar(
                    title: 'Thành công!', message: "Thêm món thành công");
              },
              child: Text("Click me!")),
          const SizedBox(
            height: MySizes.spaceBtwInputFields,
          ),
          OutlinedButton(
              onPressed: () {},
              child: Text(
                "Click me",
              )),
          TextField(
            decoration: InputDecoration(
                label: Text("hello"),
                suffixIcon: Icon(Icons.calendar_month),
                prefixIcon: Icon(Icons.energy_savings_leaf_rounded)),
          ),
          TextButton(onPressed: () {}, child: Text("Anh Duy"))
        ],
      )),
    );
  }
}
