import 'package:get/get.dart';

import 'type_details_logic.dart';

class TypeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeDetailsLogic());
  }
}
