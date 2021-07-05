import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register/app/modules/email/views/email_view.dart';
import 'package:register/app/modules/password/views/password_view.dart';
import 'package:register/app/modules/personinfo/views/personinfo_view.dart';
import 'package:register/app/modules/schedule/views/schedule_view.dart';

class HomeController extends GetxController {
  final currentStep = 0.obs;
  final numbers = [1, 2, 3, 4].obs;
  final pages =
      [EmailView(), PasswordView(), PersoninfoView(), ScheduleView()].obs;

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
