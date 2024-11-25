import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/admin/user_management/controllers/update_user_management_controller.dart';
import 'package:food_delivery_h2d/features/admin/user_management/controllers/user_management_controller.dart';
import 'package:food_delivery_h2d/features/admin/user_management/views/detail_user/detail_user.dart';
import 'package:food_delivery_h2d/features/admin/web_layout.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/enums.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/helpers/convert_role.dart';
import 'package:get/get.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserManagementController controller =
        Get.put(UserManagementController());
    final UpdateUserManagementController updateUserManagementController =
        Get.put(UpdateUserManagementController());

    return WebLayout(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return const Center(
            child: Text(
              'Không có người dùng nào',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        if (controller.userList.isEmpty) {
          return const Center(child: Text('No users found.'));
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text(
                  "Danh sách người dùng",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryTextColor,
                      ),
                ),
                const SizedBox(height: MySizes.spaceBtwItems),
                Expanded(
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
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(MySizes.borderRadiusMd),
                    //   color:
                    //       Colors.white, 
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: MyColors.darkPrimaryColor.withOpacity(0.1),
                    //       blurRadius: 4,
                    //       offset: Offset(0, 4),
                    //     ),
                    //   ],
                    // ),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Họ tên',
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
                      String statusText =
                          user.status ? "Đang hoạt động" : "Chưa duyệt";
                      String roleText = ConvertEnumRole.toDisplayName(
                          UserRole.values.firstWhere(
                              (e) => e.toString() == 'UserRole.${user.role}'));
                      return DataRow(cells: [
                        DataCell(SizedBox(child: Text(user.name))),
                        DataCell(Text(user.email)),
                        DataCell(Text(user.phone)),
                        DataCell(
                          Text(
                            statusText,
                            style: TextStyle(
                                color: ConvertEnumRole.getStatusColor(
                                    user.status)),
                          ),
                        ),
                        DataCell(Text(roleText)),
                        DataCell(Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit_outlined,
                                size: MySizes.iconMs,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      scrollable: true,
                                      title: const Text('Thông tin chi tiết'),
                                      content: Obx(() {
                                        if (controller.isLoading.value) {
                                          return const CircularProgressIndicator();
                                        } else {
                                          return DetailUser(selectedUser: user);
                                        }
                                      }),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Đóng'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            await updateUserManagementController
                                                .updateUser(
                                                    user.userId, context);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cập nhật'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: MySizes.spaceBtwItems,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                size: MySizes.iconMs,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                updateUserManagementController
                                    .deleteUser(user.userId);
                              },
                            ),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
