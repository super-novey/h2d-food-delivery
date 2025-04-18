import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/common/widgets/keyboard/mobile_wrapper.dart';
import 'package:food_delivery_h2d/common/widgets/text_field/horizontal_form_field.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_entity.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_group_entity.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/view/edit_topping_view.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/view/widgets/topping_tile.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class EditToppingGroupView extends StatefulWidget {
  const EditToppingGroupView({super.key, required this.toppingGroup});

  final ToppingGroupEntity toppingGroup;

  @override
  State<EditToppingGroupView> createState() => _EditToppingGroupViewState();
}

class _EditToppingGroupViewState extends State<EditToppingGroupView> {
  late TextEditingController nameToppingGroup;

  @override
  void initState() {
    nameToppingGroup = TextEditingController(text: widget.toppingGroup.name);
    super.initState();
  }

  @override
  void dispose() {
    nameToppingGroup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MobileWrapper(
      appBar: CustomAppBar(
        handleBack: () {
          Get.back();
        },
        title: Text(widget.toppingGroup.isNew
            ? "Thêm nhóm Topping"
            : "Chỉnh sửa nhóm Topping"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.toppingGroup.isNew
                  ? const SizedBox()
                  : MyHorizontalFormField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: widget.toppingGroup.id),
                      hintText: "",
                      lable: "Mã"),
              MyHorizontalFormField(
                  required: true,
                  controller: nameToppingGroup,
                  hintText: "VD: Nhóm Topping",
                  lable: "Tên"),
              //TODO: mon them
              Text(
                "Món thêm",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: MyColors.darkPrimaryTextColor),
              ),
              //TODO: hien thi danh cac topping
              _buildToppingList(context)

              //TODO: quyen tuy chon

              //TODO: Mon da lien ket
            ]
                .expand((e) => [
                      e,
                      const Divider(
                          color: MyColors.dividerColor, thickness: 0.1)
                    ])
                .toList(),
          ),
        ),
      ),
      bottom: _BottomNavigationBar(onDelete: () {}, onAdd: () {}),
    );
  }

  Widget _buildAddTopping(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.to(() => EditToppingView(
                topping: ToppingEntity(),
              ));
        },
        child: Column(
          children: [
            const Icon(
              Icons.add,
              color: MyColors.secondaryTextColor,
            ),
            Text(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: MyColors.secondaryTextColor),
                "Thêm topping"),
          ],
        ));
  }

  Widget _buildToppingList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.toppingGroup.toppings.map(
          (topping) => Padding(
            padding: const EdgeInsets.only(top: MySizes.md),
            child: ToppingTile(
                onTap: () => Get.to(() => EditToppingView(topping: topping)),
                topping: topping),
          ),
        ),
        Center(child: _buildAddTopping(context)),
      ],
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onAdd;

  const _BottomNavigationBar({
    required this.onDelete,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -5),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.0),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onDelete,
                  child: Text("Xóa"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: onAdd,
                  child: Text("Lưu"),
                ),
              ),
            ]
                .expand((element) => [element, const SizedBox(width: 8.0)])
                .toList()
              ..removeLast(),
          ),
        ],
      ),
    );
  }
}
