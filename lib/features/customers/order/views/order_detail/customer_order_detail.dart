import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';
import 'package:food_delivery_h2d/utils/helpers/status_helper.dart';

class CustomerOrderDetail extends StatelessWidget {
  const CustomerOrderDetail({super.key, required this.selectedOrder});
  final Order selectedOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Chi tiết đơn hàng"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: MySizes.md,
              right: MySizes.md,
              top: MySizes.lg,
              bottom: MySizes.lg),
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
                  StatusHelper
                          .custStatusTranslations[selectedOrder.custStatus] ??
                      'Unknown status',
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
                  "#${selectedOrder.id.toString()}",
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
                      selectedOrder.orderDatetime.toString()),
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
            Text(
              "Tài xế",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: MyColors.secondaryTextColor),
            ),
            const SizedBox(
              height: MySizes.xs,
            ),
            Text(
              "${selectedOrder.driverName}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: MyColors.darkPrimaryTextColor),
            ),
            const SizedBox(
              height: MySizes.xs,
            ),
            Row(
              children: [
                Text(
                  "${selectedOrder.driverPhone}",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: MyColors.secondaryTextColor),
                ),
                const SizedBox(
                  width: MySizes.sm,
                ),
                Container(color: MyColors.dividerColor, width: 0.8, height: 15),
                const SizedBox(
                  width: MySizes.sm,
                ),
                Text(
                  "${selectedOrder.driverLicensePlate}",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: MyColors.secondaryTextColor),
                ),
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            const Divider(
              color: MyColors.dividerColor,
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: MySizes.xs),
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: MyColors.primaryColor)),
                Text(
                  "Từ",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: MyColors.secondaryTextColor),
                ),
              ],
            ),
            const SizedBox(height: MySizes.xs),
            Text(
              selectedOrder.restaurantName,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: MyColors.darkPrimaryTextColor),
            ),
            const SizedBox(height: MySizes.xs),
            Text(
              selectedOrder.restAddress.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: MyColors.secondaryTextColor),
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: MySizes.xs),
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: MyColors.openColor)),
                Text(
                  "Đến",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: MyColors.secondaryTextColor),
                ),
              ],
            ),
            const SizedBox(height: MySizes.xs),
            Text(
              selectedOrder.custAddress.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: MyColors.darkPrimaryTextColor),
            ),
            const SizedBox(height: MySizes.xs),
            Text(
              "${selectedOrder.customerName} - ${selectedOrder.custPhone}",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: MyColors.secondaryTextColor),
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            const Divider(
              color: MyColors.dividerColor,
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Tên món',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: MyColors.primaryTextColor,
                              height: 2,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 50, // Fixed width for the second column
                      child: Text(
                        'SL',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: MyColors.primaryTextColor,
                              height: 2,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Thành tiền',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: MyColors.primaryTextColor,
                              height: 2,
                            ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                ...selectedOrder.orderItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150, // Matches the header column width
                          child: Text(
                            item.itemName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: MyColors.secondaryTextColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          width: 50, // Matches the header column width
                          child: Text(
                            '${item.quantity}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: MyColors.secondaryTextColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            MyFormatter.formatCurrency(item.totalPrice),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: MyColors.secondaryTextColor),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: MySizes.spaceBtwItems),
                const Divider(
                  color: MyColors.dividerColor,
                ),
                const SizedBox(height: MySizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tổng món ăn",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: MyColors.darkPrimaryTextColor),
                    ),
                    Text(
                      MyFormatter.formatCurrency(selectedOrder.getToTalPrice()),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyColors.primaryTextColor,
                            height: 2,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phí vận chuyển",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: MyColors.darkPrimaryTextColor),
                    ),
                    Text(
                      MyFormatter.formatCurrency(
                        selectedOrder.deliveryFee ?? 0,
                      ),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyColors.primaryTextColor,
                            height: 2,
                          ),
                    ),
                  ],
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
                      MyFormatter.formatCurrency(
                        (selectedOrder.totalPrice ?? 0) +
                            (selectedOrder.deliveryFee ?? 0),
                      ),
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
