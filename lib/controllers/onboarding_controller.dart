import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'translate',
      'title': 'Real-time Translation',
      'description': 'Translate conversations instantly with your earbuds.',
    },
    {
      'image': 'bluetooth',
      'title': 'Bluetooth Connectivity',
      'description':
          'Connect seamlessly to your smart earbuds for wireless translation.',
    },
    {
      'image': 'camera',
      'title': 'Photo Translation',
      'description': 'Scan and translate text from images with AI-powered OCR.',
    },
  ];

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offNamed(AppRoutes.home);
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
