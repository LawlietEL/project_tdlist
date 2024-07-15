import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/data/controller/auth_controller.dart';
import 'package:project_tdlist/app/data/controller/page_index_controller.dart';
import 'package:project_tdlist/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController(), permanent: true);
    Get.put(PageIndexController(), permanent: true);
    return FutureBuilder(
      future: authC.firstInitialized(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return Obx(() {
          return GetMaterialApp(
            title: "To Do List",
            debugShowCheckedModeBanner: false,
            initialRoute:
                authC.currentToken.value.isEmpty ? Routes.LOGIN : Routes.HOME,
            getPages: AppPages.routes,
          );
        });
      },
    );
  }
}
