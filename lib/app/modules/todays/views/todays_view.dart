import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todays_controller.dart';

class TodaysView extends GetView<TodaysController> {
  const TodaysView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodaysView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TodaysView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
