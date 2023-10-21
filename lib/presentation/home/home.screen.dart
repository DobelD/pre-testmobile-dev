import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretestmobiledev/components/app_body.dart';
import 'package:pretestmobiledev/infrastructure/navigation/routes.dart';
import 'package:pretestmobiledev/presentation/home/widget/navigation_button.dart';

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
                child: Column(
                  children: [
                    ListTile(
                      leading: CachedNetworkImage(
                        key: UniqueKey(),
                        cacheManager: controller.customCacheManager,
                        imageUrl: controller.userModels?.image ?? '',
                        height: 48,
                        width: 48,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          );
                        },
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                      ),
                      title: Text(controller.userModels?.name ?? ''),
                      trailing: IconButton(
                          onPressed: () => controller.logout(),
                          icon: const Icon(Icons.logout_rounded)),
                    ),
                    const SizedBox(height: 32),
                    NavigationButton(
                      label: "Program",
                      onPressed: () => Get.toNamed(Routes.PROGRAM),
                    ),
                    const SizedBox(height: 12),
                    NavigationButton(
                      label: "Transaction",
                      onPressed: () => Get.toNamed(Routes.TRANSACTION),
                    ),
                    const SizedBox(height: 12),
                    NavigationButton(
                      label: "History",
                      onPressed: () => Get.toNamed(Routes.HISTORY),
                    ),
                    const SizedBox(height: 12),
                    NavigationButton(
                      label: "Setting",
                      onPressed: () => Get.toNamed(Routes.SETTING),
                    ),
                    const SizedBox(height: 12),
                  ],
                ))),
      );
    });
  }
}
