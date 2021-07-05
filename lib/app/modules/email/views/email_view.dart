import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:register/app/widgets/custom_paint.dart';

import '../controllers/email_controller.dart';

class EmailView extends GetView<EmailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, (80).toDouble()),
            painter: RPSCustomPainter(),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome to',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'GIN',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                ' Finans',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.apply(
                                      color: Colors.blue,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Welcome to The Bank of The Future. Manage and track your accounts on the go.',
                            style: Theme.of(context).textTheme.subtitle1,
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
                                  icon: Icon(Icons.email),
                                  labelText: 'Email',
                                  border: InputBorder.none,
                                ),
                              ),
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
                          primary: Colors.blue.withOpacity(0.5),
                          elevation: 0.0,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                        ),
                        child: Text('Next'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
