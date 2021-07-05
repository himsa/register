import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
  final textEditingController = TextEditingController().obs;
  final textEditingControllerTime = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    textEditingController.value.text = '- Choose Date -';
    textEditingControllerTime.value.text = '- Choose Time -';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      selectedDate.value = newSelectedDate;
      textEditingController.value
        ..text = DateFormat.yMMMd().format(selectedDate.value)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: textEditingController.value.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }

  selectTime(BuildContext context) async {
    TimeOfDay? newSelectedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (newSelectedTime != null) {
      selectedTime.value = newSelectedTime;
      textEditingControllerTime.value
        ..text = '${selectedTime.value.hour}:${selectedTime.value.minute}'
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: textEditingControllerTime.value.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }

  continued() => Get.defaultDialog(middleText: 'Finish');
}
