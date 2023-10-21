import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/program.controller.dart';

class ProgramScreen extends GetView<ProgramController> {
  const ProgramScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgramScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProgramScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
