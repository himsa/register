import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:register/app/widgets/number_stepper.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.blue,
        appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(top: 40.0),
            child: NumberStepper(
              activeStep: controller.currentStep.value,
              numbers: controller.numbers,
              stepColor: Colors.white,
            ),
          ),
          preferredSize: Size.fromHeight(100.0),
        ),
        body: Column(
          children: [
            Expanded(
              child: controller.pages[controller.currentStep.value],
            ),
          ],
        ),
      ),
    );
  }
}
