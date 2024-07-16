import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/style/app_color.dart';
import 'package:project_tdlist/app/widget/custom_input.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0E3CE),
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: const Color(0xFFB0E3CE),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          Obx(
            () => CustomInput(
              controller: controller.authC.currentPasswordC,
              label: 'Old Password',
              hint: '*************',
              obsecureText: controller.authC.oldPassObs.value,
              suffixIcon: IconButton(
                icon: (controller.authC.oldPassObs.isTrue)
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  controller.authC.oldPassObs.value =
                      !(controller.authC.oldPassObs.value);
                },
              ),
            ),
          ),
          Obx(
            () => CustomInput(
              controller: controller.authC.newPasswordC,
              label: 'New Password',
              hint: '******************',
              obsecureText: controller.authC.newPassObs.value,
              suffixIcon: IconButton(
                icon: (controller.authC.newPassObs.isTrue)
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  controller.authC.newPassObs.value =
                      !(controller.authC.newPassObs.value);
                },
              ),
            ),
          ),
          Obx(
            () => CustomInput(
              controller: controller.authC.confirmNewPasswordC,
              label: 'Confirm New Password',
              hint: '******************',
              obsecureText: controller.authC.confirmNewPassObs.value,
              suffixIcon: IconButton(
                icon: (controller.authC.confirmNewPassObs.isTrue)
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  controller.authC.confirmNewPassObs.value =
                      !(controller.authC.confirmNewPassObs.value);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () async {
                  if (controller.authC.isLoading.isFalse) {
                    if (controller.authC.currentPasswordC.text.isNotEmpty &&
                        controller.authC.newPasswordC.text.isNotEmpty &&
                        controller.authC.confirmNewPasswordC.text.isNotEmpty) {
                      if (controller.authC.newPasswordC.text ==
                          controller.authC.confirmNewPasswordC.text) {
                        controller.authC.changePassword(
                          currentPassword:
                              controller.authC.currentPasswordC.text,
                          newPassword: controller.authC.newPasswordC.text,
                          confirmNewPassword:
                              controller.authC.confirmNewPasswordC.text,
                        );
                        controller.authC.currentPasswordC.clear();
                        controller.authC.newPasswordC.clear();
                        controller.authC.confirmNewPasswordC.clear();
                      } else {
                        Get.rawSnackbar(
                          snackPosition: SnackPosition.TOP,
                          message:
                              'New password and confirm password do not match',
                          backgroundColor: AppColor.error,
                        );
                      }
                    } else {
                      Get.rawSnackbar(
                        snackPosition: SnackPosition.TOP,
                        message: 'Please fill in all fields',
                        backgroundColor: AppColor.error,
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryDark,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  (controller.authC.isLoading.isFalse)
                      ? "Change Password"
                      : 'Loading...',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
