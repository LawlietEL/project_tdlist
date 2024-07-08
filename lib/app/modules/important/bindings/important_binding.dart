import 'package:get/get.dart';

import '../controllers/important_controller.dart';

class ImportantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportantController>(
      () => ImportantController(),
    );
  }
}
