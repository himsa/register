import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/personinfo_controller.dart';

class PersoninfoView extends GetView<PersoninfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .apply(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Please fill in the information below and your goal for digital saving.',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .apply(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    () => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Goal for activation'),
                            DropdownButtonFormField(
                              hint: Text(controller.selectedGoal.value),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (newValue) =>
                                  controller.setSelectedGoal,
                              items: controller.listType.map((option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Monthly income'),
                            DropdownButtonFormField(
                              hint: Text(controller.selectedIncome.value),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (newValue) =>
                                  controller.setSelectedIncome,
                              items: controller.listType.map((option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Monthly expense'),
                            DropdownButtonFormField(
                              hint: Text(controller.selectedExpense.value),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (newValue) =>
                                  controller.setSelectedExpense,
                              items: controller.listType.map((option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => controller.continued(),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.5),
                  elevation: 0.0,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
