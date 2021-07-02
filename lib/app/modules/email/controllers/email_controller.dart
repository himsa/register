import 'package:get/get.dart';
import 'package:register/app/modules/home/controllers/home_controller.dart';

class EmailController extends GetxController {
  final homeController = Get.find<HomeController>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  continued() {
    homeController.currentStep.value < 3
        ? homeController.currentStep.value++
        : null;
  }
}
