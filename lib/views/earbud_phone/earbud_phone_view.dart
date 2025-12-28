import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/earbud_phone_controller.dart';
import '../../constants/app_constants.dart';

class EarbudPhoneView extends GetView<EarbudPhoneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Earbud + Phone',
          style: AppConstants.textTheme.headlineSmall,
        ),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Text(
          'Earbud + Phone Screen Placeholder',
          style: AppConstants.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
