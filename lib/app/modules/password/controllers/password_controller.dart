import 'package:get/get.dart';
import 'package:register/app/modules/home/controllers/home_controller.dart';

import 'dart:math';

class PasswordController extends GetxController {
  final complexity = ''.obs;
  final lowerCase = false.obs;
  final upperCase = false.obs;
  final number = false.obs;
  final characterCount = false.obs;
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
  void isPasswordCompliant(String password) {
    var character = '';
    var i = 0;
    print(password);
    if (!password.isEmpty) {
      characterCount.value = password.length > 8;
      while (i < password.length) {
        character = password.substring(i, i + 1);
        if (isDigit(character, 0)) {
          number.value = isDigit(character, 0);
        } else {
          upperCase.value = character == character.toUpperCase();
          lowerCase.value = character == character.toLowerCase();
        }
        i++;
      }
    } else {
      characterCount.value = false;
      number.value = false;
      upperCase.value = false;
      lowerCase.value = false;
    }

    complexity.value = setComplexity(password);
  }

  bool isDigit(String s, int idx) =>
      "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

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
    if (_estimate < 5) {
      _complexity = 'Very Weak';
    }
    return _complexity;
  }

  continued() => Get.find<HomeController>().continued();
}
