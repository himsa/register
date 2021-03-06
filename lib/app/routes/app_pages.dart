import 'package:get/get.dart';

import 'package:register/app/modules/email/views/email_view.dart';
import 'package:register/app/modules/home/bindings/home_binding.dart';
import 'package:register/app/modules/home/views/home_view.dart';
import 'package:register/app/modules/password/views/password_view.dart';
import 'package:register/app/modules/personinfo/views/personinfo_view.dart';
import 'package:register/app/modules/schedule/views/schedule_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL,
      page: () => EmailView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD,
      page: () => PasswordView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PERSONINFO,
      page: () => PersoninfoView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => ScheduleView(),
      binding: HomeBinding(),
    ),
  ];
}
