import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/data/api_client.dart';
import '../../routes/app_pages.dart';

class AuthController extends GetxController {
  final storage = const FlutterSecureStorage();
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  String? currentToken;
  String? currentEmail;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  // Controllers for register view
  TextEditingController usernameC = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await firstInitialized();
  }

  Future<void> firstInitialized() async {
    currentToken = await storage.read(key: 'access_token');
    currentEmail = await storage.read(key: 'email');
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      var res = await ApiClient().login(
        emailC.text,
        passwordC.text,
      );
      isLoading.value = false;
      if (res.data['success'] == true) {
        await storage.write(
            key: 'access_token', value: res.data['access_token']);
        await storage.write(key: 'email', value: res.data['email']);
        currentToken = await storage.read(key: 'access_token');
        currentEmail = await storage.read(key: 'email');
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

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var res = await ApiClient().register(
        username: username,
        email: email,
        password: password,
      );
      isLoading.value = false;
      if (res.data['success'] == true) {
        await storage.write(
            key: 'access_token', value: res.data['access_token']);
        await storage.write(key: 'email', value: res.data['email']);
        currentToken = await storage.read(key: 'access_token');
        currentEmail = await storage.read(key: 'email');
        Get.offAllNamed(Routes.HOME);
        Get.rawSnackbar(
          messageText: const Text('Account created successfully'),
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
    try {
      isLoading.value = true;
      var res = await ApiClient().logout(accesstoken: currentToken!);
      isLoading.value = false;
      if (res.data['success'] == true) {
        await storage.delete(key: 'access_token');
        await storage.delete(key: 'email');
        currentToken = null;
        currentEmail = null;
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
}
