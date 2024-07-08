import 'package:get/get.dart';

import '../controllers/todays_controller.dart';

class TodaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodaysController>(
      () => TodaysController(),
    );
  }
}
