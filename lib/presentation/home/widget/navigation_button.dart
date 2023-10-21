import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key, this.onPressed, this.label});

  final Function()? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: Get.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: onPressed,
          child: Text(label ?? '-')),
    );
  }
}
