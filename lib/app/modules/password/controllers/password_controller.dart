import 'package:get/get.dart';
import 'package:register/app/modules/home/controllers/home_controller.dart';

import 'dart:math';

class PasswordController extends GetxController {
  final visible = false.obs;
  final complexity = ''.obs;
  final lowerCase = false.obs;
  final upperCase = false.obs;
  final number = false.obs;
  final characterCount = false.obs;
  final color = 0.obs;
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

  passwordVisible() => visible.value = !visible.value;

  void isPasswordValidated(String password) {
    print(password);
    if (!password.isEmpty) {
      characterCount.value = password.length > 8;
      number.value = password.contains(new RegExp(r'[0-9]'));
      upperCase.value = password.contains(new RegExp(r'[A-Z]'));
      lowerCase.value = password.contains(new RegExp(r'[a-z]'));
      complexity.value = setComplexity(password);
    } else {
      characterCount.value = false;
      number.value = false;
      upperCase.value = false;
      lowerCase.value = false;
    }
  }

  double estimateBruteforceStrength(String password) {
    if (password.isEmpty) return 0.0;
    double charsetBonus;
    if (RegExp(r'^[a-z]*$').hasMatch(password)) {
      charsetBonus = 1.0;
    } else if (RegExp(r'^[a-z0-9]*$').hasMatch(password)) {
      charsetBonus = 1.2;
    } else if (RegExp(r'^[a-zA-Z]*$').hasMatch(password)) {
      charsetBonus = 1.3;
    } else if (RegExp(r'^[a-z\-_!?]*$').hasMatch(password)) {
      charsetBonus = 1.3;
    } else if (RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password)) {
      charsetBonus = 1.5;
    } else {
      charsetBonus = 1.8;
    }

    final logisticFunction = (double x) {
      return 1.0 / (1.0 + exp(-x));
    };

    final curve = (double x) {
      return logisticFunction((x / 3.0) - 4.0);
    };
    print(curve(password.length * charsetBonus));
    return curve(password.length * charsetBonus);
  }

  String setComplexity(String password) {
    String _complexity = '';
    double _estimate = estimateBruteforceStrength(password);
    if (_estimate < 0.3 && _estimate > 0.0) {
      _complexity = 'Weak';
      color.value = 0xfff44336;
    } else if (_estimate < 0.6 && _estimate >= 0.3) {
      _complexity = 'Medium';
      color.value = 0xffff9800;
    } else if (_estimate >= 0.6) {
      _complexity = 'Strong';
      color.value = 0xff4caf50;
    }
    return _complexity;
  }

  continued() => Get.find<HomeController>().continued();
}
