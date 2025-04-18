import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/common/widgets/keyboard/mobile_wrapper.dart';
import 'package:food_delivery_h2d/common/widgets/switch/horizontal_switch.dart';
import 'package:food_delivery_h2d/common/widgets/text_field/horizontal_form_field.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_entity.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class EditToppingView extends StatefulWidget {
  const EditToppingView({super.key, required this.topping});

  final ToppingEntity topping;

  @override
  State<EditToppingView> createState() => _EditToppingViewState();
}

class _EditToppingViewState extends State<EditToppingView> {
  late TextEditingController nameTopping;
  late TextEditingController priceTopping;

  @override
  void initState() {
    nameTopping = TextEditingController(text: widget.topping.name);
    priceTopping = TextEditingController(
      text: widget.topping.price?.toString() ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.topping.isNew ? "Thêm Topping" : "Sửa Topping";
    return MobileWrapper(
      appBar: CustomAppBar(
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.save,
                  size: MySizes.iconMd,
                ),
                onPressed: () {}),
          ],
          handleBack: () {
            Get.back();
          },
          title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHorizontalFormField(
                controller: nameTopping,
                required: true,
                hintText: "VD: Tên Topping",
                lable: "Tên"),
            MyHorizontalFormField(
                required: true,
                controller: priceTopping,
                hintText: "VD: 25,000",
                lable: "Giá"),
            MyHorizontalSwitch(
              required: true,
              lable: "Còn bán",
              value: widget.topping.isActive ?? false,
              onChanged: (value) {},
            )
          ]
              .expand((e) => [
                    e,
                    const Divider(color: MyColors.dividerColor, thickness: 0.1)
                  ])
              .toList(),
        ),
      ),
      bottom: Padding(
        padding: const EdgeInsets.all(MySizes.sm),
        child: OutlinedButton(
          onPressed: () {},
          child: Text("Xóa"),
        ),
      ),
    );
  }
}
