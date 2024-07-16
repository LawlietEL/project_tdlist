import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/routes/app_pages.dart';
import 'package:project_tdlist/app/style/app_color.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/todo.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.authC.nameC,
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.person, color: AppColor.secondarySoft),
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: AppColor.secondarySoft),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
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
                    obscureText: !controller.authC.obsecureText.value,
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
                          controller.authC.obsecureText.toggle();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.authC.isLoading.isFalse) {
                          await controller.authC.register(
                              name: controller.authC.nameC.text,
                              email: controller.authC.emailC.text,
                              password: controller.authC.passwordC.text);
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
                            ? 'SIGN UP'
                            : 'Loading...',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                  child: const Text(
                    "Kembali ke halaman login",
                    style: TextStyle(color: AppColor.primaryDark),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
