import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/data/controller/auth_controller.dart';

class RegisterController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onClose() {
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  Future<bool> register() async {
    try {
      isLoading.value = true;

      // Panggil method register dari AuthController
      await _authController.register(
        username: usernameC.text,
        email: emailC.text,
        password: passwordC.text,
      );

      isLoading.value = false;
      return true; // Jika berhasil tanpa kesalahan
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Failed to register: $e',
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false; // Jika terjadi kesalahan
    }
  }
}
