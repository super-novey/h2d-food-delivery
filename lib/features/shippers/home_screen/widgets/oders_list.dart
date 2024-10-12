import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/shippers/home_screen/widgets/order_tile.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class OdersList extends StatelessWidget {
  const OdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const OrderTile();
            },
          ),
        );
      },
    );
  }
}
