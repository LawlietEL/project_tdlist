import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_tasks_controller.dart';

class AllTasksView extends GetView<AllTasksController> {
  const AllTasksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllTasksView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllTasksView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
