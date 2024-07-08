import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/routes/app_pages.dart';
import 'package:project_tdlist/app/style/app_color.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/todo.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.authC.emailC,
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.email, color: AppColor.secondarySoft),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: AppColor.secondarySoft),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: AppColor.secondaryExtraSoft),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: AppColor.secondaryExtraSoft),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: AppColor.primaryDark),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextField(
                    controller: controller.authC.passwordC,
                    obscureText: controller.authC.obsecureText.value,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.lock, color: AppColor.secondarySoft),
                      labelText: 'Password',
                      labelStyle:
                          const TextStyle(color: AppColor.secondarySoft),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: AppColor.secondaryExtraSoft),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: AppColor.secondaryExtraSoft),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: AppColor.primaryDark),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.authC.obsecureText.isTrue
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColor.secondarySoft,
                        ),
                        onPressed: () {
                          controller.authC.obsecureText.value =
                              !controller.authC.obsecureText.value;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                      child: const Text(
                        "Buat akun",
                        style: TextStyle(color: AppColor.primaryDark),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                      child: const Text(
                        "forget password?",
                        style: TextStyle(color: AppColor.primaryDark),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.authC.isLoading.isFalse) {
                          await controller.authC.login();
                          Get.toNamed(Routes
                              .HOME); // Ensure it navigates to home after login
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColor.primaryDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        controller.authC.isLoading.isFalse
                            ? 'SIGN IN'
                            : 'Loading...',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
