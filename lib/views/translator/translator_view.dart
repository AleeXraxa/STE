import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/translator_controller.dart';
import '../../constants/app_constants.dart';

class TranslatorView extends GetView<TranslatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text('Translator', style: AppConstants.textTheme.headlineSmall),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Text(
          'Translator Screen Placeholder',
          style: AppConstants.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
