import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:get/get.dart';

class OrderStatusController extends GetxController {
  var container1Progress = 0.0.obs;
  var container2Progress = 0.0.obs;
  var container3Progress = 0.0.obs;
  var orderStatus = 'preparing'.obs;
  var isContainer1Blinking =
      false.obs; // Điều khiển việc nhấp nháy của container 1

  late Timer _blinkTimer; // Timer để nhấp nháy container 1

  @override
  void onInit() {
    super.onInit();
    // Bắt đầu nhấp nháy container 1 khi trạng thái là 'waiting'
    _startBlinking();
  }

  @override
  void onClose() {
    super.onClose();
    _blinkTimer.cancel(); // Hủy Timer khi widget đóng
  }

  // Bắt đầu hiệu ứng nhấp nháy
  void _startBlinking() {
    if (orderStatus.value == 'preparing') {
      _blinkTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        // Đảo ngược giá trị của isContainer1Blinking mỗi 500ms
        isContainer1Blinking.value = !isContainer1Blinking.value;
      });
    } else {
      _blinkTimer.cancel(); // Dừng nhấp nháy khi không phải 'waiting'
      isContainer1Blinking.value = false;
    }
  }

  // Cập nhật tiến trình của các container
  void updateProgress(String status) {
    if (status == 'waiting') {
      container1Progress.value = 0.33;
      container2Progress.value = 0.0;
      container3Progress.value = 0.0;
    } else if (status == 'preparing') {
      container1Progress.value = 0.66;
      container2Progress.value = 0.66;
      container3Progress.value = 0.0;
    } else if (status == 'delivering') {
      container1Progress.value = 1.0;
      container2Progress.value = 1.0;
      container3Progress.value = 1.0;
    }
    orderStatus.value = status;
    _startBlinking(); // Kiểm tra lại trạng thái nhấp nháy khi thay đổi trạng thái
  }

  // Lấy màu của container dựa trên trạng thái
  Color getContainerColor(int container) {
    if (container == 1) {
      return (orderStatus.value == 'waiting' ||
              orderStatus.value == 'preparing')
          ? MyColors.primaryColor
          : Colors.grey;
    } else if (container == 2) {
      return (orderStatus.value == 'preparing' ||
              orderStatus.value == 'delivering')
          ? MyColors.primaryColor
          : Colors.grey;
    } else {
      return (orderStatus.value == 'delivering')
          ? MyColors.primaryColor
          : Colors.grey;
    }
  }
}
