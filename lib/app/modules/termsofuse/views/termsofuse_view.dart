import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/termsofuse_controller.dart';

class TermsofuseView extends GetView<TermsofuseController> {
  const TermsofuseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsofuseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TermsofuseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
