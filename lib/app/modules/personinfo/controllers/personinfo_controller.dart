import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register/app/modules/home/controllers/home_controller.dart';

class PersoninfoController extends GetxController {
  final selectedGoal = '- Choose Option -'.obs;
  final selectedIncome = "- Choose Option -".obs;
  final selectedExpense = "- Choose Option -".obs;
  final listType = <String>['Option First', 'Option Second', 'Option Third'];

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

  void setSelectedGoal(String value) {
    selectedGoal.value = value;
  }

  void setSelectedIncome(String value) {
    selectedIncome.value = value;
  }

  void setSelectedExpense(String value) {
    selectedExpense.value = value;
  }

  continued() => Get.find<HomeController>().continued();
}
