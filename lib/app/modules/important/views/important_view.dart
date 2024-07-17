import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_tdlist/app/widget/custom_bottom_bar.dart';

import '../controllers/important_controller.dart';

class ImportantView extends GetView<ImportantController> {
  const ImportantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Ensure the controller is accessible
    final ImportantController pageController = Get.find<ImportantController>();

    return Scaffold(
      backgroundColor: const Color(0xFFCBFFD4),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.black),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Important',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.search, color: Colors.black),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            pageController.changePage(0), // Call the changePage method
        child: Obx(() => Icon(
              pageController.pageIndex.value == 0
                  ? Icons.home
                  : Icons.home_outlined,
            )),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
