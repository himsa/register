import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:register/app/widgets/custom_paint.dart';

import '../controllers/email_controller.dart';

class EmailView extends GetView<EmailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, (80).toDouble()),
                painter: RPSCustomPainter(),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome to',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Row(
                        children: [
                          Text(
                            'GIN',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            ' Finans',
                            style: Theme.of(context).textTheme.headline4?.apply(
                                  color: Colors.blue,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
