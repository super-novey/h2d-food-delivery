import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class ImageController extends GetxController {
  RxInt activePage = 0.obs;
  late PageController pageController;

  final List<String> imagePaths = [
    MyImagePaths.img1,
    MyImagePaths.img2,
    MyImagePaths.img3
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    // Lắng nghe thay đổi của activePage và cuộn trang theo giá trị mới
    activePage.listen((pageIndex) {
      pageController.animateToPage(pageIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });

    // Tạo timer tự động chuyển ảnh sau mỗi 3 giây
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (activePage.value < imagePaths.length - 1) {
        activePage.value++;  // Chuyển sang ảnh tiếp theo
      } else {
        activePage.value = 0;  // Quay lại ảnh đầu tiên
        // Đảm bảo PageController cuộn ngay lập tức về ảnh đầu tiên
        pageController.jumpToPage(0);
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
