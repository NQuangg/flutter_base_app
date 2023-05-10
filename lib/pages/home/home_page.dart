import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/app_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(
            color: AppColors.colorPrimary,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
