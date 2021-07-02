import 'package:get/get.dart';

import '../controllers/personinfo_controller.dart';

class PersoninfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersoninfoController>(
      () => PersoninfoController(),
    );
  }
}
