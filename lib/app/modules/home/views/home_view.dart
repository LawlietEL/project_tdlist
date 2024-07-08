import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/widget/custom_bottom_bar.dart';
import '../controllers/page_index_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PageIndexController());

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      extendBody: true,
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
