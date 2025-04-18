import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/controller/topping_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_group_entity.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/view/edit_topping_group_view.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/view/widgets/topping_group_tile.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ToppingGroupList extends StatelessWidget {
  ToppingGroupList({super.key});

  final toppingController = Get.put(ToppingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildToppingGps),
        _buildAddToppingGroup,
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  Widget get _buildToppingGps {
    final toppingGps = toppingController.toppingGps;
    return ListView.builder(
        itemCount: toppingGps.length,
        itemBuilder: (_, index) {
          final toppingGp = toppingGps[index];
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: MySizes.sm),
              child: _buildToppingGroupItem(toppingGp));
        });
  }

  Widget _buildToppingGroupItem(ToppingGroupEntity item) {
    return ToppingGroupItem(
      onTap: () => Get.to(() => EditToppingGroupView(
            toppingGroup: item,
          )),
      toppingGroup: item,
    );
  }

  Widget get _buildAddToppingGroup {
    return TextButton(
        onPressed: () {
          Get.to(() => EditToppingGroupView(
                toppingGroup: ToppingGroupEntity(),
              ));
        },
        child: const Column(
          children: [
            Icon(
              Icons.add,
              color: MyColors.darkPrimaryColor,
            ),
            SizedBox(
              height: MySizes.sm,
            ),
            Text("Thêm nhóm topping"),
          ],
        ));
  }
}
