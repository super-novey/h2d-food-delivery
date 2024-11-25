import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/search/widgets/widget_search_bar.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 65,
        showBackArrow: true,
        title: const Row(
          children: [
            Expanded(
              child: WidgetSearchBar(),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: MySizes.iconMd,
            ),
          ),
        ],
      ),
      body: const Column(
        children: [Text("data")],
      ),
    );
  }
}
