import 'package:crud_firebasee/pages/create/controller.dart';

import 'package:get/get.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}