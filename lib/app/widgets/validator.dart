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
        Container(
          height: 30.0,
          child: value
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
                      size: 30.0,
                      color: Colors.green,
                    ),
                  ],
                )
              : Text(
                  validatorText,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .apply(color: Colors.white),
                ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(lowerText,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .apply(color: Colors.white)),
      ],
    );
  }
}
