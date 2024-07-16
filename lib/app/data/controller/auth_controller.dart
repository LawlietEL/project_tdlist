import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/data/api_client.dart';
import '../../routes/app_pages.dart';

class AuthController extends GetxController {
  final storage = const FlutterSecureStorage();
  RxBool isLoading = false.obs;
  RxBool oldPassObs = false.obs;
  RxBool newPassObs = false.obs;
  RxBool confirmNewPassObs = false.obs;
  RxBool obsecureText = true.obs;
  RxString currentToken = ''.obs;
  RxString currentEmail = ''.obs;
  RxString currentName = ''.obs;
  RxList<String> categories = <String>[].obs;
  RxList<String> tasks = <String>[].obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController currentPasswordC = TextEditingController();
  TextEditingController newPasswordC = TextEditingController();
  TextEditingController confirmNewPasswordC = TextEditingController();

  // Controllers for register view
  TextEditingController nameC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    firstInitialized();
  }

  Future<void> firstInitialized() async {
    currentToken.value = await storage.read(key: 'access_token') ?? '';
    currentEmail.value = await storage.read(key: 'email') ?? '';
    currentName.value = await storage.read(key: 'name') ?? '';
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var res = await ApiClient().register(
        name: name,
        email: email,
        password: password,
      );
      isLoading.value = false;
      if (res.data['success'] == true) {
        await storage.write(
            key: 'access_token', value: res.data['access_token']);
        await storage.write(key: 'email', value: res.data['email']);
        await storage.write(key: 'name', value: name);
        currentToken.value = await storage.read(key: 'access_token') ?? '';
        currentEmail.value = await storage.read(key: 'email') ?? '';
        currentName.value = await storage.read(key: 'name') ?? '';
        Get.offAllNamed(Routes.LOGIN);
        Get.rawSnackbar(
          messageText: Text(res.data['message']),
          backgroundColor: Colors.green.shade300,
        );
      } else {
        Get.rawSnackbar(
          messageText: Text(res.data['message'].toString()),
          backgroundColor: Colors.red.shade300,
        );
      }
    } catch (error) {
      isLoading.value = false;
      Get.rawSnackbar(message: error.toString());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      var res = await ApiClient().login(email, password);
      isLoading.value = false;
      if (res.data['success'] == true) {
        await storage.write(
            key: 'access_token', value: res.data['access_token']);
        await storage.write(key: 'email', value: res.data['email']);
        await storage.write(key: 'name', value: res.data['name']);
        currentToken.value = await storage.read(key: 'access_token') ?? '';
        currentEmail.value = await storage.read(key: 'email') ?? '';
        currentName.value = await storage.read(key: 'name') ?? '';
        Get.offAllNamed(Routes.HOME);
        Get.rawSnackbar(
          messageText: Text(res.data['message']),
          backgroundColor: Colors.green.shade300,
        );
      } else {
        Get.rawSnackbar(
          messageText: Text(res.data['message'].toString()),
          backgroundColor: Colors.red.shade300,
        );
      }
    } catch (error) {
      isLoading.value = false;
      Get.rawSnackbar(message: error.toString());
    }
  }

  Future<void> logout() async {
    await storage.deleteAll();
    currentToken.value = '';
    currentEmail.value = '';
    currentName.value = '';
    Get.offAllNamed(Routes.LOGIN);
  }

  void addCategory(String category) {
    categories.add(category);
  }

  void addTask(String task) {
    tasks.add(task);
  }

  Future<void> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      isLoading.value = true;

      // Validate if newPassword matches confirmNewPassword
      if (newPassword != confirmNewPassword) {
        throw 'New password and confirmation do not match';
      }

      var res = await ApiClient().changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
          confirmNewPassword: confirmNewPassword,
          accessToken: currentToken.value);

      isLoading.value = false;

      if (res.data['success'] == true) {
        Get.rawSnackbar(
          messageText: Text(res.data['message']),
          backgroundColor: Colors.green.shade300,
        );
      } else {
        Get.rawSnackbar(
          messageText: Text(res.data['message'].toString()),
          backgroundColor: Colors.red.shade300,
        );
      }
    } catch (error) {
      isLoading.value = false;
      Get.rawSnackbar(message: error.toString());
    }
  }
}
