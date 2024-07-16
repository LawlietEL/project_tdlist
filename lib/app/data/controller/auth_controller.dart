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
  RxString currentToken = ''.obs;
  RxString currentEmail = ''.obs;
  RxString currentName = ''.obs;
  RxList<String> categories = <String>[].obs;
  RxList<String> tasks = <String>[].obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  // Controllers for register view
  TextEditingController usernameC = TextEditingController();

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

  Future<void> login(String email, String password) async {
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
        await storage.write(key: 'name', value: username);
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
}
