import 'package:get/get.dart';
import 'package:sysmanagment/app/controllers/AppController.dart';
import 'package:sysmanagment/app/controllers/tranferencia_controller.dart';
import 'package:sysmanagment/app/controllers/userController.dart';

import '../controllers/auth_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => TransFerenciaController());
  }
}
