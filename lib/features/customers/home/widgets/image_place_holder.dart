import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/customers/home/controllers/image_page_controller.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());

    return Obx(() => Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: PageView.builder(
                controller: imageController.pageController,
                itemCount: imageController.imagePaths.length,
                onPageChanged: (value) {
                  imageController.activePage.value = value;
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    imageController.imagePaths[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    imageController.imagePaths.length,
                    (index) => Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: MySizes.xs),
                      child: InkWell(
                        onTap: () {
                          imageController.activePage.value = index;
                          imageController.pageController.animateToPage(index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor:
                              imageController.activePage.value == index
                                  ? Colors.yellow
                                  : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
