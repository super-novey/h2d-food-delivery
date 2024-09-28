import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/bindings/general_bindings.dart';
import 'package:food_delivery_h2d/navigation_menu.dart';
import 'package:food_delivery_h2d/utils/themes/theme.dart';
import 'package:get/get.dart';



class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const NavigationMenu(),
    );
  }
}
