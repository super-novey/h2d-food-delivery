import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/restaurants/order_management/models/order_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.selectedOrder});
  final Order selectedOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Chi tiết đơn hàng"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: MySizes.md, right: MySizes.md, top: MySizes.lg, bottom: MySizes.lg),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trạng thái",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                Text(
                  "Chưa xác nhận",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: MyColors.primaryTextColor,
                        height: 2,
                      ),
                )
              ],
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mã đơn hàng",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                Text(
                  selectedOrder.orderId.toString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: MyColors.primaryTextColor,
                        height: 2,
                      ),
                )
              ],
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Thời gian đặt hàng",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                Text(
                  MyFormatter.formatTime(
                      selectedOrder.orderDateTime.toString()),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: MyColors.primaryTextColor,
                        height: 2,
                      ),
                )
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            const Divider(
              color: MyColors.dividerColor,
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tên khách hàng",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                Text(
                  "Nguyễn Văn A",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: MyColors.primaryTextColor,
                        height: 2,
                      ),
                )
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            const Divider(
              color: MyColors.dividerColor,
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tên tài xế",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                Text(
                  "Nguyễn Văn An",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: MyColors.primaryTextColor,
                        height: 2,
                      ),
                )
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            const Divider(
              color: MyColors.dividerColor,
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectedOrder.orderItems.length,
                  itemBuilder: (context, index) {
                    final item = selectedOrder.orderItems[index];
                    return ListTile(
                      leading: Text(
                        'Tên món ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: MyColors.primaryTextColor),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.quantity.toString(),
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: MyColors.primaryTextColor),
                          ),
                          const SizedBox(
                            width: MySizes.spaceBtwSections,
                          ),
                          Text(
                            '20000đ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: MyColors.primaryTextColor),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: MySizes.spaceBtwItems),
                const Divider(
                  color: MyColors.dividerColor,
                ),
                const SizedBox(height: MySizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tổng tiền",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: MyColors.darkPrimaryTextColor),
                    ),
                    Text(
                      "20000 VNĐ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyColors.primaryTextColor,
                            height: 2,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwItems),
                Text(
                  "Ghi chú",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                const SizedBox(height: MySizes.spaceBtwItems),
                Text(
                  selectedOrder.note,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: MyColors.primaryTextColor,
                        height: 2.5,
                      ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
