import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/catogries_controller.dart';

class CatogriesView extends GetView<CatogriesController> {
  const CatogriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatogriesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CatogriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
