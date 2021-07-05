import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
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
                  Row(
                    children: [
                      Container(
                        height: 70.0,
                        width: 70.0,
                        alignment: Alignment.center,
                        child: AnimatedBuilder(
                          animation: controller.animationController,
                          builder: (context, child) {
                            return Container(
                              decoration: ShapeDecoration(
                                color: Colors.white.withOpacity(0.5),
                                shape: CircleBorder(),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  8.0 * controller.animationController.value,
                                ),
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: CircleBorder(),
                            ),
                            child: Icon(
                              Icons.calendar_today,
                              size: 24,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Schedule Video Call',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .apply(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Choose the date and time that you prefered. We will send link via email to make video call on the scheduled date and time.',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .apply(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: controller.textEditingController.value,
                        onTap: () {
                          controller.selectDate(context);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          labelText: 'Date',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: controller.textEditingControllerTime.value,
                        onTap: () {
                          controller.selectTime(context);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          labelText: 'Time',
                          border: InputBorder.none,
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
