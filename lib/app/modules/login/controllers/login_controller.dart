import 'package:get/get.dart';
import 'package:project_tdlist/app/data/controller/auth_controller.dart';

class LoginController extends GetxController {
  final authC = Get.find<AuthController>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      await authC.login(authC.emailC.text, authC.passwordC.text);
    } finally {
      isLoading.value = false;
    }
  }
}
