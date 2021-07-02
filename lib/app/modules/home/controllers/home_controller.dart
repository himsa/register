import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register/app/modules/email/views/email_view.dart';

class HomeController extends GetxController {
  final currentStep = 0.obs;
  final numbers = [1, 2, 3, 4].obs;
  final pages = [EmailView(), Container(), Container(), Container()].obs;

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
    currentStep.value < 3 ? currentStep.value++ : null;
  }

  cancel() {
    currentStep.value > 0 ? currentStep.value-- : null;
  }
}
