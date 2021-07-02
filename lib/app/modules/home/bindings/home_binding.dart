import 'package:get/get.dart';
import 'package:register/app/modules/email/controllers/email_controller.dart';
import 'package:register/app/modules/password/controllers/password_controller.dart';
import 'package:register/app/modules/personinfo/controllers/personinfo_controller.dart';
import 'package:register/app/modules/schedule/controllers/schedule_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<EmailController>(
      () => EmailController(),
    );
    Get.lazyPut<PasswordController>(
      () => PasswordController(),
    );
    Get.lazyPut<PersoninfoController>(
      () => PersoninfoController(),
    );
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(),
    );
  }
}
