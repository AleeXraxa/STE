import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../constants/app_constants.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text(
          'MultiLingual Earbuds Translator',
          style: AppConstants.textTheme.headlineSmall,
        ),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Screen',
              style: AppConstants.textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/mode_selection'),
              child: Text(
                'Select Mode',
                style: AppConstants.textTheme.labelLarge,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
