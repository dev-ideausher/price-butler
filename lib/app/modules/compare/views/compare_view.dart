import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_controller.dart';

class CompareView extends GetView<CompareController> {
  const CompareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CompareView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CompareView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
