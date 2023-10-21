import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretestmobiledev/components/app_body.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: unrelated_type_equality_checks
      var status = controller.homeStatus == HomeStatus.loading ? true : false;
      return AppBody(
        isLoading: status,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('HomeScreen'),
              centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          NetworkImage(controller.userModel?.image ?? '')),
                  title: Text(controller.userModel?.name ?? ''),
                  trailing: IconButton(
                      onPressed: () => controller.logout(),
                      icon: const Icon(Icons.logout_rounded)),
                ))),
      );
    });
  }
}
