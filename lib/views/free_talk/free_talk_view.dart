import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/free_talk_controller.dart';
import '../../constants/app_constants.dart';

class FreeTalkView extends GetView<FreeTalkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text('Free Talk', style: AppConstants.textTheme.headlineSmall),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Text(
          'Free Talk Screen Placeholder',
          style: AppConstants.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
