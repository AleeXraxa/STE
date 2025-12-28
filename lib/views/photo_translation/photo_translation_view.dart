import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/photo_translation_controller.dart';
import '../../constants/app_constants.dart';

class PhotoTranslationView extends GetView<PhotoTranslationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Photo Translation',
          style: AppConstants.textTheme.headlineSmall,
        ),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Text(
          'Photo Translation Screen Placeholder',
          style: AppConstants.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
