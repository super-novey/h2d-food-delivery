import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isWorking = true.obs;

  void toggleWorkingStatus() {
    isWorking.value = !isWorking.value;
  }
}
