import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/important_controller.dart';

class ImportantView extends GetView<ImportantController> {
  const ImportantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImportantView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ImportantView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
