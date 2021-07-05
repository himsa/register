import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:register/app/widgets/validator.dart';

import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
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
                    'Create Password',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .apply(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Password will be used to login to account',
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
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.visibility),
                          hintText: 'Create Password',
                          border: InputBorder.none,
                        ),
                        onChanged: (password) =>
                            controller.isPasswordCompliant(password),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        PasswordValidator().layout(
                          context,
                          controller.lowerCase.value,
                          'Lowercase',
                          'a',
                        ),
                        PasswordValidator().layout(
                          context,
                          controller.upperCase.value,
                          'Uppercase',
                          'A',
                        ),
                        PasswordValidator().layout(
                          context,
                          controller.number.value,
                          'Number',
                          '123',
                        ),
                        PasswordValidator().layout(
                          context,
                          controller.characterCount.value,
                          'Characters',
                          '9+',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.0,
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
