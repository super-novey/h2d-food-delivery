import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/admin/user_management/controllers/user_management_controller.dart';
import 'package:food_delivery_h2d/features/admin/web_layout.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserManagementController controller =
        Get.put(UserManagementController());

    return WebLayout(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              'Error: ${controller.errorMessage}',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        if (controller.userList.isEmpty) {
          return const Center(child: Text('No users found.'));
        }
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(28),
            child: Center(
              child: DataTable2(
                columnSpacing: 24,
                minWidth: 786,
                dividerThickness: 0,
                horizontalMargin: 12,
                dataRowHeight: 56,
                
                showCheckboxColumn: true,
                headingTextStyle: Theme.of(context).textTheme.titleSmall,
                headingRowColor: WidgetStateProperty.resolveWith(
                    (states) => MyColors.primaryBackgroundColor),
                headingRowDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MySizes.borderRadiusMd),
                    topRight: Radius.circular(MySizes.borderRadiusMd),
                  ),
                ),
                columns: const [
                  DataColumn(
                    label: Text(
                      'Họ tên',
                      // style: TextStyle(
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Email',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'SĐT',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Trạng thái',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Vai trò',
                    ),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                ],
                rows: controller.userList.map((user) {
                  return DataRow(cells: [
                    DataCell(SizedBox(child: Text(user.name))),
                    DataCell(Text(user.email)),
                    DataCell(Text(user.phone)),
                    DataCell(Text(user.status.toString())),
                    DataCell(Text(user.role)),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit_outlined,
                            size: MySizes.iconMs,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: MySizes.spaceBtwItems,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            size: MySizes.iconMs,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
