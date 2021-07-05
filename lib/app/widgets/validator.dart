import 'package:flutter/material.dart';

class PasswordValidator {
  Widget layout(
    BuildContext context,
    bool value,
    String lowerText,
    String validatorText,
  ) {
    return Column(
      children: [
        value
            ? Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.check_circle_rounded,
                    size: 40.0,
                    color: Colors.green,
                  ),
                ],
              )
            : Text(
                validatorText,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: Colors.white),
              ),
        Text(lowerText),
      ],
    );
  }
}
