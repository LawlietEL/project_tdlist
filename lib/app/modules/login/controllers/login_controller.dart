import 'package:get/get.dart';
import 'package:project_tdlist/app/data/controller/auth_controller.dart';

class LoginController extends GetxController {
  final authC = Get.find<AuthController>();
  var isLoading = false.obs;
}
