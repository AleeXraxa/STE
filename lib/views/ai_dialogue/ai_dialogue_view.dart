import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/ai_dialogue_controller.dart';
import '../../constants/app_constants.dart';

class AiDialogueView extends GetView<AiDialogueController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text('AI Dialogue', style: AppConstants.textTheme.headlineSmall),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Text(
          'AI Dialogue Screen Placeholder',
          style: AppConstants.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
