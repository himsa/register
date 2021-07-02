import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/personinfo_controller.dart';

class PersoninfoView extends GetView<PersoninfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PersoninfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PersoninfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
