import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/transaction.controller.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransactionScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TransactionScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
